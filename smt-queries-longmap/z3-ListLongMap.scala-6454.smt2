; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82732 () Bool)

(assert start!82732)

(declare-fun b_free!18697 () Bool)

(declare-fun b_next!18697 () Bool)

(assert (=> start!82732 (= b_free!18697 (not b_next!18697))))

(declare-fun tp!65212 () Bool)

(declare-fun b_and!30195 () Bool)

(assert (=> start!82732 (= tp!65212 b_and!30195)))

(declare-fun b!963098 () Bool)

(declare-fun e!543193 () Bool)

(declare-fun tp_is_empty!21499 () Bool)

(assert (=> b!963098 (= e!543193 tp_is_empty!21499)))

(declare-fun b!963100 () Bool)

(declare-fun res!644270 () Bool)

(declare-fun e!543194 () Bool)

(assert (=> b!963100 (=> (not res!644270) (not e!543194))))

(declare-datatypes ((array!59112 0))(
  ( (array!59113 (arr!28420 (Array (_ BitVec 32) (_ BitVec 64))) (size!28900 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59112)

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963100 (= res!644270 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28900 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28900 _keys!1686))))))

(declare-fun b!963101 () Bool)

(declare-fun e!543197 () Bool)

(assert (=> b!963101 (= e!543197 tp_is_empty!21499)))

(declare-fun mapIsEmpty!34243 () Bool)

(declare-fun mapRes!34243 () Bool)

(assert (=> mapIsEmpty!34243 mapRes!34243))

(declare-fun b!963102 () Bool)

(assert (=> b!963102 (= e!543194 false)))

(declare-datatypes ((V!33649 0))(
  ( (V!33650 (val!10800 Int)) )
))
(declare-datatypes ((ValueCell!10268 0))(
  ( (ValueCellFull!10268 (v!13355 V!33649)) (EmptyCell!10268) )
))
(declare-datatypes ((array!59114 0))(
  ( (array!59115 (arr!28421 (Array (_ BitVec 32) ValueCell!10268)) (size!28901 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59114)

(declare-fun lt!431210 () Bool)

(declare-fun minValue!1342 () V!33649)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33649)

(declare-datatypes ((tuple2!13848 0))(
  ( (tuple2!13849 (_1!6935 (_ BitVec 64)) (_2!6935 V!33649)) )
))
(declare-datatypes ((List!19700 0))(
  ( (Nil!19697) (Cons!19696 (h!20864 tuple2!13848) (t!28055 List!19700)) )
))
(declare-datatypes ((ListLongMap!12547 0))(
  ( (ListLongMap!12548 (toList!6289 List!19700)) )
))
(declare-fun contains!5404 (ListLongMap!12547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3522 (array!59112 array!59114 (_ BitVec 32) (_ BitVec 32) V!33649 V!33649 (_ BitVec 32) Int) ListLongMap!12547)

(assert (=> b!963102 (= lt!431210 (contains!5404 (getCurrentListMap!3522 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28420 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34243 () Bool)

(declare-fun tp!65211 () Bool)

(assert (=> mapNonEmpty!34243 (= mapRes!34243 (and tp!65211 e!543193))))

(declare-fun mapRest!34243 () (Array (_ BitVec 32) ValueCell!10268))

(declare-fun mapValue!34243 () ValueCell!10268)

(declare-fun mapKey!34243 () (_ BitVec 32))

(assert (=> mapNonEmpty!34243 (= (arr!28421 _values!1400) (store mapRest!34243 mapKey!34243 mapValue!34243))))

(declare-fun b!963103 () Bool)

(declare-fun res!644267 () Bool)

(assert (=> b!963103 (=> (not res!644267) (not e!543194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963103 (= res!644267 (validKeyInArray!0 (select (arr!28420 _keys!1686) i!803)))))

(declare-fun b!963104 () Bool)

(declare-fun res!644266 () Bool)

(assert (=> b!963104 (=> (not res!644266) (not e!543194))))

(assert (=> b!963104 (= res!644266 (and (= (size!28901 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28900 _keys!1686) (size!28901 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963105 () Bool)

(declare-fun res!644269 () Bool)

(assert (=> b!963105 (=> (not res!644269) (not e!543194))))

(declare-datatypes ((List!19701 0))(
  ( (Nil!19698) (Cons!19697 (h!20865 (_ BitVec 64)) (t!28056 List!19701)) )
))
(declare-fun arrayNoDuplicates!0 (array!59112 (_ BitVec 32) List!19701) Bool)

(assert (=> b!963105 (= res!644269 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19698))))

(declare-fun b!963106 () Bool)

(declare-fun res!644271 () Bool)

(assert (=> b!963106 (=> (not res!644271) (not e!543194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59112 (_ BitVec 32)) Bool)

(assert (=> b!963106 (= res!644271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963099 () Bool)

(declare-fun e!543196 () Bool)

(assert (=> b!963099 (= e!543196 (and e!543197 mapRes!34243))))

(declare-fun condMapEmpty!34243 () Bool)

(declare-fun mapDefault!34243 () ValueCell!10268)

(assert (=> b!963099 (= condMapEmpty!34243 (= (arr!28421 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10268)) mapDefault!34243)))))

(declare-fun res!644268 () Bool)

(assert (=> start!82732 (=> (not res!644268) (not e!543194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82732 (= res!644268 (validMask!0 mask!2110))))

(assert (=> start!82732 e!543194))

(assert (=> start!82732 true))

(declare-fun array_inv!22093 (array!59114) Bool)

(assert (=> start!82732 (and (array_inv!22093 _values!1400) e!543196)))

(declare-fun array_inv!22094 (array!59112) Bool)

(assert (=> start!82732 (array_inv!22094 _keys!1686)))

(assert (=> start!82732 tp!65212))

(assert (=> start!82732 tp_is_empty!21499))

(assert (= (and start!82732 res!644268) b!963104))

(assert (= (and b!963104 res!644266) b!963106))

(assert (= (and b!963106 res!644271) b!963105))

(assert (= (and b!963105 res!644269) b!963100))

(assert (= (and b!963100 res!644270) b!963103))

(assert (= (and b!963103 res!644267) b!963102))

(assert (= (and b!963099 condMapEmpty!34243) mapIsEmpty!34243))

(assert (= (and b!963099 (not condMapEmpty!34243)) mapNonEmpty!34243))

(get-info :version)

(assert (= (and mapNonEmpty!34243 ((_ is ValueCellFull!10268) mapValue!34243)) b!963098))

(assert (= (and b!963099 ((_ is ValueCellFull!10268) mapDefault!34243)) b!963101))

(assert (= start!82732 b!963099))

(declare-fun m!893203 () Bool)

(assert (=> b!963102 m!893203))

(declare-fun m!893205 () Bool)

(assert (=> b!963102 m!893205))

(assert (=> b!963102 m!893203))

(assert (=> b!963102 m!893205))

(declare-fun m!893207 () Bool)

(assert (=> b!963102 m!893207))

(declare-fun m!893209 () Bool)

(assert (=> b!963106 m!893209))

(declare-fun m!893211 () Bool)

(assert (=> start!82732 m!893211))

(declare-fun m!893213 () Bool)

(assert (=> start!82732 m!893213))

(declare-fun m!893215 () Bool)

(assert (=> start!82732 m!893215))

(declare-fun m!893217 () Bool)

(assert (=> mapNonEmpty!34243 m!893217))

(declare-fun m!893219 () Bool)

(assert (=> b!963105 m!893219))

(assert (=> b!963103 m!893205))

(assert (=> b!963103 m!893205))

(declare-fun m!893221 () Bool)

(assert (=> b!963103 m!893221))

(check-sat (not b!963103) tp_is_empty!21499 (not b!963106) (not b!963105) (not mapNonEmpty!34243) (not start!82732) (not b_next!18697) b_and!30195 (not b!963102))
(check-sat b_and!30195 (not b_next!18697))
