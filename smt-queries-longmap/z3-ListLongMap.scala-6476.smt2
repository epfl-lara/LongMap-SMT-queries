; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82678 () Bool)

(assert start!82678)

(declare-fun b_free!18829 () Bool)

(declare-fun b_next!18829 () Bool)

(assert (=> start!82678 (= b_free!18829 (not b_next!18829))))

(declare-fun tp!65607 () Bool)

(declare-fun b_and!30291 () Bool)

(assert (=> start!82678 (= tp!65607 b_and!30291)))

(declare-fun b!964041 () Bool)

(declare-fun e!543485 () Bool)

(declare-fun tp_is_empty!21631 () Bool)

(assert (=> b!964041 (= e!543485 tp_is_empty!21631)))

(declare-fun mapNonEmpty!34441 () Bool)

(declare-fun mapRes!34441 () Bool)

(declare-fun tp!65608 () Bool)

(declare-fun e!543487 () Bool)

(assert (=> mapNonEmpty!34441 (= mapRes!34441 (and tp!65608 e!543487))))

(declare-datatypes ((V!33825 0))(
  ( (V!33826 (val!10866 Int)) )
))
(declare-datatypes ((ValueCell!10334 0))(
  ( (ValueCellFull!10334 (v!13423 V!33825)) (EmptyCell!10334) )
))
(declare-fun mapRest!34441 () (Array (_ BitVec 32) ValueCell!10334))

(declare-datatypes ((array!59284 0))(
  ( (array!59285 (arr!28511 (Array (_ BitVec 32) ValueCell!10334)) (size!28992 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59284)

(declare-fun mapKey!34441 () (_ BitVec 32))

(declare-fun mapValue!34441 () ValueCell!10334)

(assert (=> mapNonEmpty!34441 (= (arr!28511 _values!1400) (store mapRest!34441 mapKey!34441 mapValue!34441))))

(declare-fun b!964042 () Bool)

(declare-fun e!543482 () Bool)

(declare-fun e!543486 () Bool)

(assert (=> b!964042 (= e!543482 (not e!543486))))

(declare-fun res!645309 () Bool)

(assert (=> b!964042 (=> res!645309 e!543486)))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-datatypes ((array!59286 0))(
  ( (array!59287 (arr!28512 (Array (_ BitVec 32) (_ BitVec 64))) (size!28993 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59286)

(assert (=> b!964042 (= res!645309 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!28993 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!33825)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33825)

(declare-datatypes ((tuple2!14032 0))(
  ( (tuple2!14033 (_1!7027 (_ BitVec 64)) (_2!7027 V!33825)) )
))
(declare-datatypes ((List!19840 0))(
  ( (Nil!19837) (Cons!19836 (h!20998 tuple2!14032) (t!28194 List!19840)) )
))
(declare-datatypes ((ListLongMap!12719 0))(
  ( (ListLongMap!12720 (toList!6375 List!19840)) )
))
(declare-fun contains!5422 (ListLongMap!12719 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3537 (array!59286 array!59284 (_ BitVec 32) (_ BitVec 32) V!33825 V!33825 (_ BitVec 32) Int) ListLongMap!12719)

(assert (=> b!964042 (contains!5422 (getCurrentListMap!3537 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28512 _keys!1686) i!803))))

(declare-datatypes ((Unit!32136 0))(
  ( (Unit!32137) )
))
(declare-fun lt!430840 () Unit!32136)

(declare-fun lemmaInListMapFromThenInFromMinusOne!33 (array!59286 array!59284 (_ BitVec 32) (_ BitVec 32) V!33825 V!33825 (_ BitVec 32) (_ BitVec 32) Int) Unit!32136)

(assert (=> b!964042 (= lt!430840 (lemmaInListMapFromThenInFromMinusOne!33 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964043 () Bool)

(declare-fun res!645306 () Bool)

(assert (=> b!964043 (=> (not res!645306) (not e!543482))))

(declare-datatypes ((List!19841 0))(
  ( (Nil!19838) (Cons!19837 (h!20999 (_ BitVec 64)) (t!28195 List!19841)) )
))
(declare-fun arrayNoDuplicates!0 (array!59286 (_ BitVec 32) List!19841) Bool)

(assert (=> b!964043 (= res!645306 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19838))))

(declare-fun b!964044 () Bool)

(declare-fun res!645305 () Bool)

(assert (=> b!964044 (=> (not res!645305) (not e!543482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964044 (= res!645305 (validKeyInArray!0 (select (arr!28512 _keys!1686) i!803)))))

(declare-fun b!964045 () Bool)

(declare-fun res!645303 () Bool)

(assert (=> b!964045 (=> (not res!645303) (not e!543482))))

(assert (=> b!964045 (= res!645303 (and (= (size!28992 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28993 _keys!1686) (size!28992 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34441 () Bool)

(assert (=> mapIsEmpty!34441 mapRes!34441))

(declare-fun res!645307 () Bool)

(assert (=> start!82678 (=> (not res!645307) (not e!543482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82678 (= res!645307 (validMask!0 mask!2110))))

(assert (=> start!82678 e!543482))

(assert (=> start!82678 true))

(declare-fun e!543484 () Bool)

(declare-fun array_inv!22145 (array!59284) Bool)

(assert (=> start!82678 (and (array_inv!22145 _values!1400) e!543484)))

(declare-fun array_inv!22146 (array!59286) Bool)

(assert (=> start!82678 (array_inv!22146 _keys!1686)))

(assert (=> start!82678 tp!65607))

(assert (=> start!82678 tp_is_empty!21631))

(declare-fun b!964046 () Bool)

(declare-fun res!645308 () Bool)

(assert (=> b!964046 (=> (not res!645308) (not e!543482))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964046 (= res!645308 (bvsgt from!2084 newFrom!159))))

(declare-fun b!964047 () Bool)

(declare-fun res!645310 () Bool)

(assert (=> b!964047 (=> (not res!645310) (not e!543482))))

(assert (=> b!964047 (= res!645310 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28993 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28993 _keys!1686))))))

(declare-fun b!964048 () Bool)

(assert (=> b!964048 (= e!543487 tp_is_empty!21631)))

(declare-fun b!964049 () Bool)

(declare-fun res!645304 () Bool)

(assert (=> b!964049 (=> (not res!645304) (not e!543482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59286 (_ BitVec 32)) Bool)

(assert (=> b!964049 (= res!645304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964050 () Bool)

(assert (=> b!964050 (= e!543486 true)))

(assert (=> b!964050 (contains!5422 (getCurrentListMap!3537 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28512 _keys!1686) i!803))))

(declare-fun lt!430841 () Unit!32136)

(declare-fun lemmaInListMapFromThenInFromSmaller!30 (array!59286 array!59284 (_ BitVec 32) (_ BitVec 32) V!33825 V!33825 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32136)

(assert (=> b!964050 (= lt!430841 (lemmaInListMapFromThenInFromSmaller!30 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964051 () Bool)

(declare-fun res!645311 () Bool)

(assert (=> b!964051 (=> (not res!645311) (not e!543482))))

(assert (=> b!964051 (= res!645311 (contains!5422 (getCurrentListMap!3537 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28512 _keys!1686) i!803)))))

(declare-fun b!964052 () Bool)

(assert (=> b!964052 (= e!543484 (and e!543485 mapRes!34441))))

(declare-fun condMapEmpty!34441 () Bool)

(declare-fun mapDefault!34441 () ValueCell!10334)

(assert (=> b!964052 (= condMapEmpty!34441 (= (arr!28511 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10334)) mapDefault!34441)))))

(assert (= (and start!82678 res!645307) b!964045))

(assert (= (and b!964045 res!645303) b!964049))

(assert (= (and b!964049 res!645304) b!964043))

(assert (= (and b!964043 res!645306) b!964047))

(assert (= (and b!964047 res!645310) b!964044))

(assert (= (and b!964044 res!645305) b!964051))

(assert (= (and b!964051 res!645311) b!964046))

(assert (= (and b!964046 res!645308) b!964042))

(assert (= (and b!964042 (not res!645309)) b!964050))

(assert (= (and b!964052 condMapEmpty!34441) mapIsEmpty!34441))

(assert (= (and b!964052 (not condMapEmpty!34441)) mapNonEmpty!34441))

(get-info :version)

(assert (= (and mapNonEmpty!34441 ((_ is ValueCellFull!10334) mapValue!34441)) b!964048))

(assert (= (and b!964052 ((_ is ValueCellFull!10334) mapDefault!34441)) b!964041))

(assert (= start!82678 b!964052))

(declare-fun m!892795 () Bool)

(assert (=> b!964044 m!892795))

(assert (=> b!964044 m!892795))

(declare-fun m!892797 () Bool)

(assert (=> b!964044 m!892797))

(declare-fun m!892799 () Bool)

(assert (=> start!82678 m!892799))

(declare-fun m!892801 () Bool)

(assert (=> start!82678 m!892801))

(declare-fun m!892803 () Bool)

(assert (=> start!82678 m!892803))

(declare-fun m!892805 () Bool)

(assert (=> b!964050 m!892805))

(assert (=> b!964050 m!892795))

(assert (=> b!964050 m!892805))

(assert (=> b!964050 m!892795))

(declare-fun m!892807 () Bool)

(assert (=> b!964050 m!892807))

(declare-fun m!892809 () Bool)

(assert (=> b!964050 m!892809))

(declare-fun m!892811 () Bool)

(assert (=> b!964043 m!892811))

(declare-fun m!892813 () Bool)

(assert (=> b!964042 m!892813))

(assert (=> b!964042 m!892795))

(assert (=> b!964042 m!892813))

(assert (=> b!964042 m!892795))

(declare-fun m!892815 () Bool)

(assert (=> b!964042 m!892815))

(declare-fun m!892817 () Bool)

(assert (=> b!964042 m!892817))

(declare-fun m!892819 () Bool)

(assert (=> b!964049 m!892819))

(declare-fun m!892821 () Bool)

(assert (=> b!964051 m!892821))

(assert (=> b!964051 m!892795))

(assert (=> b!964051 m!892821))

(assert (=> b!964051 m!892795))

(declare-fun m!892823 () Bool)

(assert (=> b!964051 m!892823))

(declare-fun m!892825 () Bool)

(assert (=> mapNonEmpty!34441 m!892825))

(check-sat tp_is_empty!21631 (not b!964042) (not mapNonEmpty!34441) (not b!964043) (not start!82678) b_and!30291 (not b_next!18829) (not b!964050) (not b!964051) (not b!964049) (not b!964044))
(check-sat b_and!30291 (not b_next!18829))
