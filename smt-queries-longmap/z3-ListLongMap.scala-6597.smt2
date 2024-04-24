; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83634 () Bool)

(assert start!83634)

(declare-fun b_free!19453 () Bool)

(declare-fun b_next!19453 () Bool)

(assert (=> start!83634 (= b_free!19453 (not b_next!19453))))

(declare-fun tp!67647 () Bool)

(declare-fun b_and!31065 () Bool)

(assert (=> start!83634 (= tp!67647 b_and!31065)))

(declare-fun b!975850 () Bool)

(declare-fun res!652979 () Bool)

(declare-fun e!550087 () Bool)

(assert (=> b!975850 (=> (not res!652979) (not e!550087))))

(declare-datatypes ((array!60782 0))(
  ( (array!60783 (arr!29250 (Array (_ BitVec 32) (_ BitVec 64))) (size!29730 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60782)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975850 (= res!652979 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29730 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29730 _keys!1717))))))

(declare-fun res!652983 () Bool)

(assert (=> start!83634 (=> (not res!652983) (not e!550087))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83634 (= res!652983 (validMask!0 mask!2147))))

(assert (=> start!83634 e!550087))

(assert (=> start!83634 true))

(declare-datatypes ((V!34793 0))(
  ( (V!34794 (val!11229 Int)) )
))
(declare-datatypes ((ValueCell!10697 0))(
  ( (ValueCellFull!10697 (v!13785 V!34793)) (EmptyCell!10697) )
))
(declare-datatypes ((array!60784 0))(
  ( (array!60785 (arr!29251 (Array (_ BitVec 32) ValueCell!10697)) (size!29731 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60784)

(declare-fun e!550085 () Bool)

(declare-fun array_inv!22671 (array!60784) Bool)

(assert (=> start!83634 (and (array_inv!22671 _values!1425) e!550085)))

(declare-fun tp_is_empty!22357 () Bool)

(assert (=> start!83634 tp_is_empty!22357))

(assert (=> start!83634 tp!67647))

(declare-fun array_inv!22672 (array!60782) Bool)

(assert (=> start!83634 (array_inv!22672 _keys!1717)))

(declare-fun b!975851 () Bool)

(declare-fun res!652981 () Bool)

(assert (=> b!975851 (=> (not res!652981) (not e!550087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975851 (= res!652981 (validKeyInArray!0 (select (arr!29250 _keys!1717) i!822)))))

(declare-fun b!975852 () Bool)

(assert (=> b!975852 (= e!550087 false)))

(declare-datatypes ((tuple2!14442 0))(
  ( (tuple2!14443 (_1!7232 (_ BitVec 64)) (_2!7232 V!34793)) )
))
(declare-datatypes ((List!20290 0))(
  ( (Nil!20287) (Cons!20286 (h!21454 tuple2!14442) (t!28759 List!20290)) )
))
(declare-datatypes ((ListLongMap!13141 0))(
  ( (ListLongMap!13142 (toList!6586 List!20290)) )
))
(declare-fun lt!433176 () ListLongMap!13141)

(declare-fun zeroValue!1367 () V!34793)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34793)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3819 (array!60782 array!60784 (_ BitVec 32) (_ BitVec 32) V!34793 V!34793 (_ BitVec 32) Int) ListLongMap!13141)

(assert (=> b!975852 (= lt!433176 (getCurrentListMap!3819 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!975853 () Bool)

(declare-fun res!652984 () Bool)

(assert (=> b!975853 (=> (not res!652984) (not e!550087))))

(assert (=> b!975853 (= res!652984 (and (= (size!29731 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29730 _keys!1717) (size!29731 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975854 () Bool)

(declare-fun e!550083 () Bool)

(declare-fun mapRes!35545 () Bool)

(assert (=> b!975854 (= e!550085 (and e!550083 mapRes!35545))))

(declare-fun condMapEmpty!35545 () Bool)

(declare-fun mapDefault!35545 () ValueCell!10697)

(assert (=> b!975854 (= condMapEmpty!35545 (= (arr!29251 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10697)) mapDefault!35545)))))

(declare-fun b!975855 () Bool)

(declare-fun res!652985 () Bool)

(assert (=> b!975855 (=> (not res!652985) (not e!550087))))

(declare-fun contains!5687 (ListLongMap!13141 (_ BitVec 64)) Bool)

(assert (=> b!975855 (= res!652985 (contains!5687 (getCurrentListMap!3819 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29250 _keys!1717) i!822)))))

(declare-fun b!975856 () Bool)

(declare-fun e!550086 () Bool)

(assert (=> b!975856 (= e!550086 tp_is_empty!22357)))

(declare-fun mapNonEmpty!35545 () Bool)

(declare-fun tp!67648 () Bool)

(assert (=> mapNonEmpty!35545 (= mapRes!35545 (and tp!67648 e!550086))))

(declare-fun mapKey!35545 () (_ BitVec 32))

(declare-fun mapValue!35545 () ValueCell!10697)

(declare-fun mapRest!35545 () (Array (_ BitVec 32) ValueCell!10697))

(assert (=> mapNonEmpty!35545 (= (arr!29251 _values!1425) (store mapRest!35545 mapKey!35545 mapValue!35545))))

(declare-fun b!975857 () Bool)

(assert (=> b!975857 (= e!550083 tp_is_empty!22357)))

(declare-fun b!975858 () Bool)

(declare-fun res!652982 () Bool)

(assert (=> b!975858 (=> (not res!652982) (not e!550087))))

(declare-datatypes ((List!20291 0))(
  ( (Nil!20288) (Cons!20287 (h!21455 (_ BitVec 64)) (t!28760 List!20291)) )
))
(declare-fun arrayNoDuplicates!0 (array!60782 (_ BitVec 32) List!20291) Bool)

(assert (=> b!975858 (= res!652982 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20288))))

(declare-fun b!975859 () Bool)

(declare-fun res!652980 () Bool)

(assert (=> b!975859 (=> (not res!652980) (not e!550087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60782 (_ BitVec 32)) Bool)

(assert (=> b!975859 (= res!652980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35545 () Bool)

(assert (=> mapIsEmpty!35545 mapRes!35545))

(assert (= (and start!83634 res!652983) b!975853))

(assert (= (and b!975853 res!652984) b!975859))

(assert (= (and b!975859 res!652980) b!975858))

(assert (= (and b!975858 res!652982) b!975850))

(assert (= (and b!975850 res!652979) b!975851))

(assert (= (and b!975851 res!652981) b!975855))

(assert (= (and b!975855 res!652985) b!975852))

(assert (= (and b!975854 condMapEmpty!35545) mapIsEmpty!35545))

(assert (= (and b!975854 (not condMapEmpty!35545)) mapNonEmpty!35545))

(get-info :version)

(assert (= (and mapNonEmpty!35545 ((_ is ValueCellFull!10697) mapValue!35545)) b!975856))

(assert (= (and b!975854 ((_ is ValueCellFull!10697) mapDefault!35545)) b!975857))

(assert (= start!83634 b!975854))

(declare-fun m!903617 () Bool)

(assert (=> b!975858 m!903617))

(declare-fun m!903619 () Bool)

(assert (=> b!975852 m!903619))

(declare-fun m!903621 () Bool)

(assert (=> start!83634 m!903621))

(declare-fun m!903623 () Bool)

(assert (=> start!83634 m!903623))

(declare-fun m!903625 () Bool)

(assert (=> start!83634 m!903625))

(declare-fun m!903627 () Bool)

(assert (=> b!975859 m!903627))

(declare-fun m!903629 () Bool)

(assert (=> mapNonEmpty!35545 m!903629))

(declare-fun m!903631 () Bool)

(assert (=> b!975855 m!903631))

(declare-fun m!903633 () Bool)

(assert (=> b!975855 m!903633))

(assert (=> b!975855 m!903631))

(assert (=> b!975855 m!903633))

(declare-fun m!903635 () Bool)

(assert (=> b!975855 m!903635))

(assert (=> b!975851 m!903633))

(assert (=> b!975851 m!903633))

(declare-fun m!903637 () Bool)

(assert (=> b!975851 m!903637))

(check-sat (not b!975851) (not b!975855) (not b!975858) (not start!83634) (not mapNonEmpty!35545) tp_is_empty!22357 (not b!975859) b_and!31065 (not b_next!19453) (not b!975852))
(check-sat b_and!31065 (not b_next!19453))
