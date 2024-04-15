; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82166 () Bool)

(assert start!82166)

(declare-fun b_free!18457 () Bool)

(declare-fun b_next!18457 () Bool)

(assert (=> start!82166 (= b_free!18457 (not b_next!18457))))

(declare-fun tp!64333 () Bool)

(declare-fun b_and!29919 () Bool)

(assert (=> start!82166 (= tp!64333 b_and!29919)))

(declare-fun mapNonEmpty!33724 () Bool)

(declare-fun mapRes!33724 () Bool)

(declare-fun tp!64332 () Bool)

(declare-fun e!539849 () Bool)

(assert (=> mapNonEmpty!33724 (= mapRes!33724 (and tp!64332 e!539849))))

(declare-fun mapKey!33724 () (_ BitVec 32))

(declare-datatypes ((V!33201 0))(
  ( (V!33202 (val!10632 Int)) )
))
(declare-datatypes ((ValueCell!10100 0))(
  ( (ValueCellFull!10100 (v!13188 V!33201)) (EmptyCell!10100) )
))
(declare-fun mapValue!33724 () ValueCell!10100)

(declare-fun mapRest!33724 () (Array (_ BitVec 32) ValueCell!10100))

(declare-datatypes ((array!58366 0))(
  ( (array!58367 (arr!28057 (Array (_ BitVec 32) ValueCell!10100)) (size!28538 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58366)

(assert (=> mapNonEmpty!33724 (= (arr!28057 _values!1386) (store mapRest!33724 mapKey!33724 mapValue!33724))))

(declare-fun b!957610 () Bool)

(declare-fun e!539850 () Bool)

(assert (=> b!957610 (= e!539850 false)))

(declare-fun lt!430141 () Bool)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun minValue!1328 () V!33201)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58368 0))(
  ( (array!58369 (arr!28058 (Array (_ BitVec 32) (_ BitVec 64))) (size!28539 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58368)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33201)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13754 0))(
  ( (tuple2!13755 (_1!6888 (_ BitVec 64)) (_2!6888 V!33201)) )
))
(declare-datatypes ((List!19538 0))(
  ( (Nil!19535) (Cons!19534 (h!20696 tuple2!13754) (t!27892 List!19538)) )
))
(declare-datatypes ((ListLongMap!12441 0))(
  ( (ListLongMap!12442 (toList!6236 List!19538)) )
))
(declare-fun contains!5282 (ListLongMap!12441 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3398 (array!58368 array!58366 (_ BitVec 32) (_ BitVec 32) V!33201 V!33201 (_ BitVec 32) Int) ListLongMap!12441)

(assert (=> b!957610 (= lt!430141 (contains!5282 (getCurrentListMap!3398 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28058 _keys!1668) i!793)))))

(declare-fun b!957611 () Bool)

(declare-fun e!539851 () Bool)

(declare-fun tp_is_empty!21163 () Bool)

(assert (=> b!957611 (= e!539851 tp_is_empty!21163)))

(declare-fun b!957612 () Bool)

(declare-fun res!641041 () Bool)

(assert (=> b!957612 (=> (not res!641041) (not e!539850))))

(assert (=> b!957612 (= res!641041 (and (= (size!28538 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28539 _keys!1668) (size!28538 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957613 () Bool)

(assert (=> b!957613 (= e!539849 tp_is_empty!21163)))

(declare-fun b!957614 () Bool)

(declare-fun res!641043 () Bool)

(assert (=> b!957614 (=> (not res!641043) (not e!539850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58368 (_ BitVec 32)) Bool)

(assert (=> b!957614 (= res!641043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun mapIsEmpty!33724 () Bool)

(assert (=> mapIsEmpty!33724 mapRes!33724))

(declare-fun b!957615 () Bool)

(declare-fun res!641044 () Bool)

(assert (=> b!957615 (=> (not res!641044) (not e!539850))))

(declare-datatypes ((List!19539 0))(
  ( (Nil!19536) (Cons!19535 (h!20697 (_ BitVec 64)) (t!27893 List!19539)) )
))
(declare-fun arrayNoDuplicates!0 (array!58368 (_ BitVec 32) List!19539) Bool)

(assert (=> b!957615 (= res!641044 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19536))))

(declare-fun res!641042 () Bool)

(assert (=> start!82166 (=> (not res!641042) (not e!539850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82166 (= res!641042 (validMask!0 mask!2088))))

(assert (=> start!82166 e!539850))

(assert (=> start!82166 true))

(assert (=> start!82166 tp_is_empty!21163))

(declare-fun array_inv!21821 (array!58368) Bool)

(assert (=> start!82166 (array_inv!21821 _keys!1668)))

(declare-fun e!539848 () Bool)

(declare-fun array_inv!21822 (array!58366) Bool)

(assert (=> start!82166 (and (array_inv!21822 _values!1386) e!539848)))

(assert (=> start!82166 tp!64333))

(declare-fun b!957609 () Bool)

(assert (=> b!957609 (= e!539848 (and e!539851 mapRes!33724))))

(declare-fun condMapEmpty!33724 () Bool)

(declare-fun mapDefault!33724 () ValueCell!10100)

(assert (=> b!957609 (= condMapEmpty!33724 (= (arr!28057 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10100)) mapDefault!33724)))))

(declare-fun b!957616 () Bool)

(declare-fun res!641046 () Bool)

(assert (=> b!957616 (=> (not res!641046) (not e!539850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957616 (= res!641046 (validKeyInArray!0 (select (arr!28058 _keys!1668) i!793)))))

(declare-fun b!957617 () Bool)

(declare-fun res!641045 () Bool)

(assert (=> b!957617 (=> (not res!641045) (not e!539850))))

(assert (=> b!957617 (= res!641045 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28539 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28539 _keys!1668))))))

(assert (= (and start!82166 res!641042) b!957612))

(assert (= (and b!957612 res!641041) b!957614))

(assert (= (and b!957614 res!641043) b!957615))

(assert (= (and b!957615 res!641044) b!957617))

(assert (= (and b!957617 res!641045) b!957616))

(assert (= (and b!957616 res!641046) b!957610))

(assert (= (and b!957609 condMapEmpty!33724) mapIsEmpty!33724))

(assert (= (and b!957609 (not condMapEmpty!33724)) mapNonEmpty!33724))

(get-info :version)

(assert (= (and mapNonEmpty!33724 ((_ is ValueCellFull!10100) mapValue!33724)) b!957613))

(assert (= (and b!957609 ((_ is ValueCellFull!10100) mapDefault!33724)) b!957611))

(assert (= start!82166 b!957609))

(declare-fun m!887919 () Bool)

(assert (=> start!82166 m!887919))

(declare-fun m!887921 () Bool)

(assert (=> start!82166 m!887921))

(declare-fun m!887923 () Bool)

(assert (=> start!82166 m!887923))

(declare-fun m!887925 () Bool)

(assert (=> b!957614 m!887925))

(declare-fun m!887927 () Bool)

(assert (=> b!957616 m!887927))

(assert (=> b!957616 m!887927))

(declare-fun m!887929 () Bool)

(assert (=> b!957616 m!887929))

(declare-fun m!887931 () Bool)

(assert (=> mapNonEmpty!33724 m!887931))

(declare-fun m!887933 () Bool)

(assert (=> b!957615 m!887933))

(declare-fun m!887935 () Bool)

(assert (=> b!957610 m!887935))

(assert (=> b!957610 m!887927))

(assert (=> b!957610 m!887935))

(assert (=> b!957610 m!887927))

(declare-fun m!887937 () Bool)

(assert (=> b!957610 m!887937))

(check-sat (not b!957615) (not b!957616) (not b!957614) (not b_next!18457) (not b!957610) (not mapNonEmpty!33724) b_and!29919 (not start!82166) tp_is_empty!21163)
(check-sat b_and!29919 (not b_next!18457))
