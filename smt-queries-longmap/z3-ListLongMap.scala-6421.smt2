; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82304 () Bool)

(assert start!82304)

(declare-fun b_free!18589 () Bool)

(declare-fun b_next!18589 () Bool)

(assert (=> start!82304 (= b_free!18589 (not b_next!18589))))

(declare-fun tp!64738 () Bool)

(declare-fun b_and!30051 () Bool)

(assert (=> start!82304 (= tp!64738 b_and!30051)))

(declare-fun res!642348 () Bool)

(declare-fun e!540886 () Bool)

(assert (=> start!82304 (=> (not res!642348) (not e!540886))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82304 (= res!642348 (validMask!0 mask!2088))))

(assert (=> start!82304 e!540886))

(assert (=> start!82304 true))

(declare-fun tp_is_empty!21301 () Bool)

(assert (=> start!82304 tp_is_empty!21301))

(declare-datatypes ((array!58630 0))(
  ( (array!58631 (arr!28189 (Array (_ BitVec 32) (_ BitVec 64))) (size!28670 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58630)

(declare-fun array_inv!21909 (array!58630) Bool)

(assert (=> start!82304 (array_inv!21909 _keys!1668)))

(declare-datatypes ((V!33385 0))(
  ( (V!33386 (val!10701 Int)) )
))
(declare-datatypes ((ValueCell!10169 0))(
  ( (ValueCellFull!10169 (v!13257 V!33385)) (EmptyCell!10169) )
))
(declare-datatypes ((array!58632 0))(
  ( (array!58633 (arr!28190 (Array (_ BitVec 32) ValueCell!10169)) (size!28671 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58632)

(declare-fun e!540885 () Bool)

(declare-fun array_inv!21910 (array!58632) Bool)

(assert (=> start!82304 (and (array_inv!21910 _values!1386) e!540885)))

(assert (=> start!82304 tp!64738))

(declare-fun b!959535 () Bool)

(declare-fun e!540884 () Bool)

(declare-fun mapRes!33931 () Bool)

(assert (=> b!959535 (= e!540885 (and e!540884 mapRes!33931))))

(declare-fun condMapEmpty!33931 () Bool)

(declare-fun mapDefault!33931 () ValueCell!10169)

(assert (=> b!959535 (= condMapEmpty!33931 (= (arr!28190 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10169)) mapDefault!33931)))))

(declare-fun b!959536 () Bool)

(declare-fun res!642347 () Bool)

(assert (=> b!959536 (=> (not res!642347) (not e!540886))))

(declare-fun i!793 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!959536 (= res!642347 (validKeyInArray!0 (select (arr!28189 _keys!1668) i!793)))))

(declare-fun b!959537 () Bool)

(assert (=> b!959537 (= e!540884 tp_is_empty!21301)))

(declare-fun b!959538 () Bool)

(assert (=> b!959538 (= e!540886 false)))

(declare-fun minValue!1328 () V!33385)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun lt!430339 () Bool)

(declare-fun defaultEntry!1389 () Int)

(declare-fun zeroValue!1328 () V!33385)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13848 0))(
  ( (tuple2!13849 (_1!6935 (_ BitVec 64)) (_2!6935 V!33385)) )
))
(declare-datatypes ((List!19633 0))(
  ( (Nil!19630) (Cons!19629 (h!20791 tuple2!13848) (t!27987 List!19633)) )
))
(declare-datatypes ((ListLongMap!12535 0))(
  ( (ListLongMap!12536 (toList!6283 List!19633)) )
))
(declare-fun contains!5326 (ListLongMap!12535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3445 (array!58630 array!58632 (_ BitVec 32) (_ BitVec 32) V!33385 V!33385 (_ BitVec 32) Int) ListLongMap!12535)

(assert (=> b!959538 (= lt!430339 (contains!5326 (getCurrentListMap!3445 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28189 _keys!1668) i!793)))))

(declare-fun mapNonEmpty!33931 () Bool)

(declare-fun tp!64737 () Bool)

(declare-fun e!540883 () Bool)

(assert (=> mapNonEmpty!33931 (= mapRes!33931 (and tp!64737 e!540883))))

(declare-fun mapKey!33931 () (_ BitVec 32))

(declare-fun mapValue!33931 () ValueCell!10169)

(declare-fun mapRest!33931 () (Array (_ BitVec 32) ValueCell!10169))

(assert (=> mapNonEmpty!33931 (= (arr!28190 _values!1386) (store mapRest!33931 mapKey!33931 mapValue!33931))))

(declare-fun b!959539 () Bool)

(declare-fun res!642346 () Bool)

(assert (=> b!959539 (=> (not res!642346) (not e!540886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58630 (_ BitVec 32)) Bool)

(assert (=> b!959539 (= res!642346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!959540 () Bool)

(declare-fun res!642349 () Bool)

(assert (=> b!959540 (=> (not res!642349) (not e!540886))))

(assert (=> b!959540 (= res!642349 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28670 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28670 _keys!1668))))))

(declare-fun mapIsEmpty!33931 () Bool)

(assert (=> mapIsEmpty!33931 mapRes!33931))

(declare-fun b!959541 () Bool)

(declare-fun res!642350 () Bool)

(assert (=> b!959541 (=> (not res!642350) (not e!540886))))

(declare-datatypes ((List!19634 0))(
  ( (Nil!19631) (Cons!19630 (h!20792 (_ BitVec 64)) (t!27988 List!19634)) )
))
(declare-fun arrayNoDuplicates!0 (array!58630 (_ BitVec 32) List!19634) Bool)

(assert (=> b!959541 (= res!642350 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19631))))

(declare-fun b!959542 () Bool)

(assert (=> b!959542 (= e!540883 tp_is_empty!21301)))

(declare-fun b!959543 () Bool)

(declare-fun res!642351 () Bool)

(assert (=> b!959543 (=> (not res!642351) (not e!540886))))

(assert (=> b!959543 (= res!642351 (and (= (size!28671 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28670 _keys!1668) (size!28671 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(assert (= (and start!82304 res!642348) b!959543))

(assert (= (and b!959543 res!642351) b!959539))

(assert (= (and b!959539 res!642346) b!959541))

(assert (= (and b!959541 res!642350) b!959540))

(assert (= (and b!959540 res!642349) b!959536))

(assert (= (and b!959536 res!642347) b!959538))

(assert (= (and b!959535 condMapEmpty!33931) mapIsEmpty!33931))

(assert (= (and b!959535 (not condMapEmpty!33931)) mapNonEmpty!33931))

(get-info :version)

(assert (= (and mapNonEmpty!33931 ((_ is ValueCellFull!10169) mapValue!33931)) b!959542))

(assert (= (and b!959535 ((_ is ValueCellFull!10169) mapDefault!33931)) b!959537))

(assert (= start!82304 b!959535))

(declare-fun m!889431 () Bool)

(assert (=> start!82304 m!889431))

(declare-fun m!889433 () Bool)

(assert (=> start!82304 m!889433))

(declare-fun m!889435 () Bool)

(assert (=> start!82304 m!889435))

(declare-fun m!889437 () Bool)

(assert (=> b!959536 m!889437))

(assert (=> b!959536 m!889437))

(declare-fun m!889439 () Bool)

(assert (=> b!959536 m!889439))

(declare-fun m!889441 () Bool)

(assert (=> b!959541 m!889441))

(declare-fun m!889443 () Bool)

(assert (=> b!959538 m!889443))

(assert (=> b!959538 m!889437))

(assert (=> b!959538 m!889443))

(assert (=> b!959538 m!889437))

(declare-fun m!889445 () Bool)

(assert (=> b!959538 m!889445))

(declare-fun m!889447 () Bool)

(assert (=> mapNonEmpty!33931 m!889447))

(declare-fun m!889449 () Bool)

(assert (=> b!959539 m!889449))

(check-sat (not b!959539) b_and!30051 (not start!82304) (not mapNonEmpty!33931) (not b!959536) (not b!959541) (not b!959538) tp_is_empty!21301 (not b_next!18589))
(check-sat b_and!30051 (not b_next!18589))
