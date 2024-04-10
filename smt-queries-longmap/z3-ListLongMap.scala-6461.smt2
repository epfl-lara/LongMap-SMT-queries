; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82608 () Bool)

(assert start!82608)

(declare-fun b_free!18741 () Bool)

(declare-fun b_next!18741 () Bool)

(assert (=> start!82608 (= b_free!18741 (not b_next!18741))))

(declare-fun tp!65342 () Bool)

(declare-fun b_and!30229 () Bool)

(assert (=> start!82608 (= tp!65342 b_and!30229)))

(declare-fun b!962799 () Bool)

(declare-fun res!644329 () Bool)

(declare-fun e!542941 () Bool)

(assert (=> b!962799 (=> (not res!644329) (not e!542941))))

(declare-datatypes ((array!59181 0))(
  ( (array!59182 (arr!28459 (Array (_ BitVec 32) (_ BitVec 64))) (size!28938 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59181)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962799 (= res!644329 (validKeyInArray!0 (select (arr!28459 _keys!1686) i!803)))))

(declare-fun b!962800 () Bool)

(assert (=> b!962800 (= e!542941 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33707 0))(
  ( (V!33708 (val!10822 Int)) )
))
(declare-datatypes ((ValueCell!10290 0))(
  ( (ValueCellFull!10290 (v!13380 V!33707)) (EmptyCell!10290) )
))
(declare-datatypes ((array!59183 0))(
  ( (array!59184 (arr!28460 (Array (_ BitVec 32) ValueCell!10290)) (size!28939 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59183)

(declare-fun minValue!1342 () V!33707)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33707)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13902 0))(
  ( (tuple2!13903 (_1!6962 (_ BitVec 64)) (_2!6962 V!33707)) )
))
(declare-datatypes ((List!19751 0))(
  ( (Nil!19748) (Cons!19747 (h!20909 tuple2!13902) (t!28114 List!19751)) )
))
(declare-datatypes ((ListLongMap!12599 0))(
  ( (ListLongMap!12600 (toList!6315 List!19751)) )
))
(declare-fun contains!5418 (ListLongMap!12599 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3548 (array!59181 array!59183 (_ BitVec 32) (_ BitVec 32) V!33707 V!33707 (_ BitVec 32) Int) ListLongMap!12599)

(assert (=> b!962800 (contains!5418 (getCurrentListMap!3548 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28459 _keys!1686) i!803))))

(declare-datatypes ((Unit!32215 0))(
  ( (Unit!32216) )
))
(declare-fun lt!430915 () Unit!32215)

(declare-fun lemmaInListMapFromThenInFromMinusOne!2 (array!59181 array!59183 (_ BitVec 32) (_ BitVec 32) V!33707 V!33707 (_ BitVec 32) (_ BitVec 32) Int) Unit!32215)

(assert (=> b!962800 (= lt!430915 (lemmaInListMapFromThenInFromMinusOne!2 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!962801 () Bool)

(declare-fun res!644328 () Bool)

(assert (=> b!962801 (=> (not res!644328) (not e!542941))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!962801 (= res!644328 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28938 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28938 _keys!1686))))))

(declare-fun b!962802 () Bool)

(declare-fun res!644335 () Bool)

(assert (=> b!962802 (=> (not res!644335) (not e!542941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59181 (_ BitVec 32)) Bool)

(assert (=> b!962802 (= res!644335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962803 () Bool)

(declare-fun res!644331 () Bool)

(assert (=> b!962803 (=> (not res!644331) (not e!542941))))

(assert (=> b!962803 (= res!644331 (bvsgt from!2084 newFrom!159))))

(declare-fun b!962804 () Bool)

(declare-fun e!542943 () Bool)

(declare-fun tp_is_empty!21543 () Bool)

(assert (=> b!962804 (= e!542943 tp_is_empty!21543)))

(declare-fun b!962805 () Bool)

(declare-fun res!644334 () Bool)

(assert (=> b!962805 (=> (not res!644334) (not e!542941))))

(declare-datatypes ((List!19752 0))(
  ( (Nil!19749) (Cons!19748 (h!20910 (_ BitVec 64)) (t!28115 List!19752)) )
))
(declare-fun arrayNoDuplicates!0 (array!59181 (_ BitVec 32) List!19752) Bool)

(assert (=> b!962805 (= res!644334 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19749))))

(declare-fun res!644333 () Bool)

(assert (=> start!82608 (=> (not res!644333) (not e!542941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82608 (= res!644333 (validMask!0 mask!2110))))

(assert (=> start!82608 e!542941))

(assert (=> start!82608 true))

(declare-fun e!542944 () Bool)

(declare-fun array_inv!22051 (array!59183) Bool)

(assert (=> start!82608 (and (array_inv!22051 _values!1400) e!542944)))

(declare-fun array_inv!22052 (array!59181) Bool)

(assert (=> start!82608 (array_inv!22052 _keys!1686)))

(assert (=> start!82608 tp!65342))

(assert (=> start!82608 tp_is_empty!21543))

(declare-fun mapIsEmpty!34309 () Bool)

(declare-fun mapRes!34309 () Bool)

(assert (=> mapIsEmpty!34309 mapRes!34309))

(declare-fun b!962806 () Bool)

(declare-fun res!644332 () Bool)

(assert (=> b!962806 (=> (not res!644332) (not e!542941))))

(assert (=> b!962806 (= res!644332 (and (= (size!28939 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28938 _keys!1686) (size!28939 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962807 () Bool)

(declare-fun res!644330 () Bool)

(assert (=> b!962807 (=> (not res!644330) (not e!542941))))

(assert (=> b!962807 (= res!644330 (contains!5418 (getCurrentListMap!3548 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28459 _keys!1686) i!803)))))

(declare-fun b!962808 () Bool)

(declare-fun e!542945 () Bool)

(assert (=> b!962808 (= e!542945 tp_is_empty!21543)))

(declare-fun b!962809 () Bool)

(assert (=> b!962809 (= e!542944 (and e!542945 mapRes!34309))))

(declare-fun condMapEmpty!34309 () Bool)

(declare-fun mapDefault!34309 () ValueCell!10290)

(assert (=> b!962809 (= condMapEmpty!34309 (= (arr!28460 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10290)) mapDefault!34309)))))

(declare-fun mapNonEmpty!34309 () Bool)

(declare-fun tp!65343 () Bool)

(assert (=> mapNonEmpty!34309 (= mapRes!34309 (and tp!65343 e!542943))))

(declare-fun mapValue!34309 () ValueCell!10290)

(declare-fun mapKey!34309 () (_ BitVec 32))

(declare-fun mapRest!34309 () (Array (_ BitVec 32) ValueCell!10290))

(assert (=> mapNonEmpty!34309 (= (arr!28460 _values!1400) (store mapRest!34309 mapKey!34309 mapValue!34309))))

(assert (= (and start!82608 res!644333) b!962806))

(assert (= (and b!962806 res!644332) b!962802))

(assert (= (and b!962802 res!644335) b!962805))

(assert (= (and b!962805 res!644334) b!962801))

(assert (= (and b!962801 res!644328) b!962799))

(assert (= (and b!962799 res!644329) b!962807))

(assert (= (and b!962807 res!644330) b!962803))

(assert (= (and b!962803 res!644331) b!962800))

(assert (= (and b!962809 condMapEmpty!34309) mapIsEmpty!34309))

(assert (= (and b!962809 (not condMapEmpty!34309)) mapNonEmpty!34309))

(get-info :version)

(assert (= (and mapNonEmpty!34309 ((_ is ValueCellFull!10290) mapValue!34309)) b!962804))

(assert (= (and b!962809 ((_ is ValueCellFull!10290) mapDefault!34309)) b!962808))

(assert (= start!82608 b!962809))

(declare-fun m!892355 () Bool)

(assert (=> mapNonEmpty!34309 m!892355))

(declare-fun m!892357 () Bool)

(assert (=> b!962800 m!892357))

(declare-fun m!892359 () Bool)

(assert (=> b!962800 m!892359))

(assert (=> b!962800 m!892357))

(assert (=> b!962800 m!892359))

(declare-fun m!892361 () Bool)

(assert (=> b!962800 m!892361))

(declare-fun m!892363 () Bool)

(assert (=> b!962800 m!892363))

(declare-fun m!892365 () Bool)

(assert (=> b!962805 m!892365))

(declare-fun m!892367 () Bool)

(assert (=> start!82608 m!892367))

(declare-fun m!892369 () Bool)

(assert (=> start!82608 m!892369))

(declare-fun m!892371 () Bool)

(assert (=> start!82608 m!892371))

(assert (=> b!962799 m!892359))

(assert (=> b!962799 m!892359))

(declare-fun m!892373 () Bool)

(assert (=> b!962799 m!892373))

(declare-fun m!892375 () Bool)

(assert (=> b!962807 m!892375))

(assert (=> b!962807 m!892359))

(assert (=> b!962807 m!892375))

(assert (=> b!962807 m!892359))

(declare-fun m!892377 () Bool)

(assert (=> b!962807 m!892377))

(declare-fun m!892379 () Bool)

(assert (=> b!962802 m!892379))

(check-sat (not mapNonEmpty!34309) (not b!962799) (not b!962802) tp_is_empty!21543 (not b_next!18741) b_and!30229 (not start!82608) (not b!962807) (not b!962805) (not b!962800))
(check-sat b_and!30229 (not b_next!18741))
