; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40894 () Bool)

(assert start!40894)

(declare-fun b_free!10843 () Bool)

(declare-fun b_next!10843 () Bool)

(assert (=> start!40894 (= b_free!10843 (not b_next!10843))))

(declare-fun tp!38356 () Bool)

(declare-fun b_and!18995 () Bool)

(assert (=> start!40894 (= tp!38356 b_and!18995)))

(declare-fun b!454531 () Bool)

(declare-fun res!270884 () Bool)

(declare-fun e!265904 () Bool)

(assert (=> b!454531 (=> (not res!270884) (not e!265904))))

(declare-datatypes ((array!28158 0))(
  ( (array!28159 (arr!13522 (Array (_ BitVec 32) (_ BitVec 64))) (size!13874 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28158)

(declare-datatypes ((List!8056 0))(
  ( (Nil!8053) (Cons!8052 (h!8908 (_ BitVec 64)) (t!13876 List!8056)) )
))
(declare-fun arrayNoDuplicates!0 (array!28158 (_ BitVec 32) List!8056) Bool)

(assert (=> b!454531 (= res!270884 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8053))))

(declare-fun b!454532 () Bool)

(declare-fun e!265906 () Bool)

(declare-fun tp_is_empty!12181 () Bool)

(assert (=> b!454532 (= e!265906 tp_is_empty!12181)))

(declare-fun b!454534 () Bool)

(declare-fun e!265902 () Bool)

(assert (=> b!454534 (= e!265902 tp_is_empty!12181)))

(declare-fun b!454535 () Bool)

(declare-fun res!270887 () Bool)

(assert (=> b!454535 (=> (not res!270887) (not e!265904))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17347 0))(
  ( (V!17348 (val!6135 Int)) )
))
(declare-datatypes ((ValueCell!5747 0))(
  ( (ValueCellFull!5747 (v!8402 V!17347)) (EmptyCell!5747) )
))
(declare-datatypes ((array!28160 0))(
  ( (array!28161 (arr!13523 (Array (_ BitVec 32) ValueCell!5747)) (size!13875 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28160)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!454535 (= res!270887 (and (= (size!13875 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13874 _keys!709) (size!13875 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454536 () Bool)

(declare-fun res!270891 () Bool)

(assert (=> b!454536 (=> (not res!270891) (not e!265904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454536 (= res!270891 (validMask!0 mask!1025))))

(declare-fun b!454537 () Bool)

(declare-fun e!265901 () Bool)

(assert (=> b!454537 (= e!265901 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17347)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!206180 () array!28158)

(declare-fun zeroValue!515 () V!17347)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!7988 0))(
  ( (tuple2!7989 (_1!4005 (_ BitVec 64)) (_2!4005 V!17347)) )
))
(declare-datatypes ((List!8057 0))(
  ( (Nil!8054) (Cons!8053 (h!8909 tuple2!7988) (t!13877 List!8057)) )
))
(declare-datatypes ((ListLongMap!6903 0))(
  ( (ListLongMap!6904 (toList!3467 List!8057)) )
))
(declare-fun lt!206178 () ListLongMap!6903)

(declare-fun v!412 () V!17347)

(declare-fun getCurrentListMapNoExtraKeys!1696 (array!28158 array!28160 (_ BitVec 32) (_ BitVec 32) V!17347 V!17347 (_ BitVec 32) Int) ListLongMap!6903)

(assert (=> b!454537 (= lt!206178 (getCurrentListMapNoExtraKeys!1696 lt!206180 (array!28161 (store (arr!13523 _values!549) i!563 (ValueCellFull!5747 v!412)) (size!13875 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206179 () ListLongMap!6903)

(assert (=> b!454537 (= lt!206179 (getCurrentListMapNoExtraKeys!1696 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19912 () Bool)

(declare-fun mapRes!19912 () Bool)

(declare-fun tp!38355 () Bool)

(assert (=> mapNonEmpty!19912 (= mapRes!19912 (and tp!38355 e!265902))))

(declare-fun mapRest!19912 () (Array (_ BitVec 32) ValueCell!5747))

(declare-fun mapValue!19912 () ValueCell!5747)

(declare-fun mapKey!19912 () (_ BitVec 32))

(assert (=> mapNonEmpty!19912 (= (arr!13523 _values!549) (store mapRest!19912 mapKey!19912 mapValue!19912))))

(declare-fun b!454538 () Bool)

(assert (=> b!454538 (= e!265904 e!265901)))

(declare-fun res!270889 () Bool)

(assert (=> b!454538 (=> (not res!270889) (not e!265901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28158 (_ BitVec 32)) Bool)

(assert (=> b!454538 (= res!270889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206180 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!454538 (= lt!206180 (array!28159 (store (arr!13522 _keys!709) i!563 k0!794) (size!13874 _keys!709)))))

(declare-fun b!454539 () Bool)

(declare-fun res!270888 () Bool)

(assert (=> b!454539 (=> (not res!270888) (not e!265901))))

(assert (=> b!454539 (= res!270888 (arrayNoDuplicates!0 lt!206180 #b00000000000000000000000000000000 Nil!8053))))

(declare-fun b!454540 () Bool)

(declare-fun e!265903 () Bool)

(assert (=> b!454540 (= e!265903 (and e!265906 mapRes!19912))))

(declare-fun condMapEmpty!19912 () Bool)

(declare-fun mapDefault!19912 () ValueCell!5747)

(assert (=> b!454540 (= condMapEmpty!19912 (= (arr!13523 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5747)) mapDefault!19912)))))

(declare-fun b!454541 () Bool)

(declare-fun res!270882 () Bool)

(assert (=> b!454541 (=> (not res!270882) (not e!265904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454541 (= res!270882 (validKeyInArray!0 k0!794))))

(declare-fun b!454542 () Bool)

(declare-fun res!270890 () Bool)

(assert (=> b!454542 (=> (not res!270890) (not e!265904))))

(assert (=> b!454542 (= res!270890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454533 () Bool)

(declare-fun res!270892 () Bool)

(assert (=> b!454533 (=> (not res!270892) (not e!265904))))

(assert (=> b!454533 (= res!270892 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13874 _keys!709))))))

(declare-fun res!270881 () Bool)

(assert (=> start!40894 (=> (not res!270881) (not e!265904))))

(assert (=> start!40894 (= res!270881 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13874 _keys!709))))))

(assert (=> start!40894 e!265904))

(assert (=> start!40894 tp_is_empty!12181))

(assert (=> start!40894 tp!38356))

(assert (=> start!40894 true))

(declare-fun array_inv!9874 (array!28160) Bool)

(assert (=> start!40894 (and (array_inv!9874 _values!549) e!265903)))

(declare-fun array_inv!9875 (array!28158) Bool)

(assert (=> start!40894 (array_inv!9875 _keys!709)))

(declare-fun b!454543 () Bool)

(declare-fun res!270885 () Bool)

(assert (=> b!454543 (=> (not res!270885) (not e!265904))))

(assert (=> b!454543 (= res!270885 (or (= (select (arr!13522 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13522 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19912 () Bool)

(assert (=> mapIsEmpty!19912 mapRes!19912))

(declare-fun b!454544 () Bool)

(declare-fun res!270886 () Bool)

(assert (=> b!454544 (=> (not res!270886) (not e!265904))))

(declare-fun arrayContainsKey!0 (array!28158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454544 (= res!270886 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454545 () Bool)

(declare-fun res!270883 () Bool)

(assert (=> b!454545 (=> (not res!270883) (not e!265901))))

(assert (=> b!454545 (= res!270883 (bvsle from!863 i!563))))

(assert (= (and start!40894 res!270881) b!454536))

(assert (= (and b!454536 res!270891) b!454535))

(assert (= (and b!454535 res!270887) b!454542))

(assert (= (and b!454542 res!270890) b!454531))

(assert (= (and b!454531 res!270884) b!454533))

(assert (= (and b!454533 res!270892) b!454541))

(assert (= (and b!454541 res!270882) b!454543))

(assert (= (and b!454543 res!270885) b!454544))

(assert (= (and b!454544 res!270886) b!454538))

(assert (= (and b!454538 res!270889) b!454539))

(assert (= (and b!454539 res!270888) b!454545))

(assert (= (and b!454545 res!270883) b!454537))

(assert (= (and b!454540 condMapEmpty!19912) mapIsEmpty!19912))

(assert (= (and b!454540 (not condMapEmpty!19912)) mapNonEmpty!19912))

(get-info :version)

(assert (= (and mapNonEmpty!19912 ((_ is ValueCellFull!5747) mapValue!19912)) b!454534))

(assert (= (and b!454540 ((_ is ValueCellFull!5747) mapDefault!19912)) b!454532))

(assert (= start!40894 b!454540))

(declare-fun m!438843 () Bool)

(assert (=> start!40894 m!438843))

(declare-fun m!438845 () Bool)

(assert (=> start!40894 m!438845))

(declare-fun m!438847 () Bool)

(assert (=> b!454531 m!438847))

(declare-fun m!438849 () Bool)

(assert (=> b!454539 m!438849))

(declare-fun m!438851 () Bool)

(assert (=> b!454541 m!438851))

(declare-fun m!438853 () Bool)

(assert (=> b!454536 m!438853))

(declare-fun m!438855 () Bool)

(assert (=> b!454538 m!438855))

(declare-fun m!438857 () Bool)

(assert (=> b!454538 m!438857))

(declare-fun m!438859 () Bool)

(assert (=> mapNonEmpty!19912 m!438859))

(declare-fun m!438861 () Bool)

(assert (=> b!454543 m!438861))

(declare-fun m!438863 () Bool)

(assert (=> b!454544 m!438863))

(declare-fun m!438865 () Bool)

(assert (=> b!454542 m!438865))

(declare-fun m!438867 () Bool)

(assert (=> b!454537 m!438867))

(declare-fun m!438869 () Bool)

(assert (=> b!454537 m!438869))

(declare-fun m!438871 () Bool)

(assert (=> b!454537 m!438871))

(check-sat tp_is_empty!12181 (not b!454531) (not b!454539) (not b!454537) b_and!18995 (not b!454536) (not b!454544) (not b!454542) (not b!454541) (not start!40894) (not b_next!10843) (not mapNonEmpty!19912) (not b!454538))
(check-sat b_and!18995 (not b_next!10843))
