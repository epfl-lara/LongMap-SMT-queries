; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33972 () Bool)

(assert start!33972)

(declare-fun b_free!7117 () Bool)

(declare-fun b_next!7117 () Bool)

(assert (=> start!33972 (= b_free!7117 (not b_next!7117))))

(declare-fun tp!24870 () Bool)

(declare-fun b_and!14281 () Bool)

(assert (=> start!33972 (= tp!24870 b_and!14281)))

(declare-fun b!338309 () Bool)

(declare-fun res!186906 () Bool)

(declare-fun e!207569 () Bool)

(assert (=> b!338309 (=> (not res!186906) (not e!207569))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10403 0))(
  ( (V!10404 (val!3579 Int)) )
))
(declare-fun zeroValue!1467 () V!10403)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3191 0))(
  ( (ValueCellFull!3191 (v!5740 V!10403)) (EmptyCell!3191) )
))
(declare-datatypes ((array!17715 0))(
  ( (array!17716 (arr!8383 (Array (_ BitVec 32) ValueCell!3191)) (size!8736 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17715)

(declare-datatypes ((array!17717 0))(
  ( (array!17718 (arr!8384 (Array (_ BitVec 32) (_ BitVec 64))) (size!8737 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17717)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10403)

(declare-datatypes ((tuple2!5140 0))(
  ( (tuple2!5141 (_1!2581 (_ BitVec 64)) (_2!2581 V!10403)) )
))
(declare-datatypes ((List!4770 0))(
  ( (Nil!4767) (Cons!4766 (h!5622 tuple2!5140) (t!9859 List!4770)) )
))
(declare-datatypes ((ListLongMap!4043 0))(
  ( (ListLongMap!4044 (toList!2037 List!4770)) )
))
(declare-fun contains!2097 (ListLongMap!4043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1543 (array!17717 array!17715 (_ BitVec 32) (_ BitVec 32) V!10403 V!10403 (_ BitVec 32) Int) ListLongMap!4043)

(assert (=> b!338309 (= res!186906 (not (contains!2097 (getCurrentListMap!1543 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun res!186905 () Bool)

(assert (=> start!33972 (=> (not res!186905) (not e!207569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33972 (= res!186905 (validMask!0 mask!2385))))

(assert (=> start!33972 e!207569))

(assert (=> start!33972 true))

(declare-fun tp_is_empty!7069 () Bool)

(assert (=> start!33972 tp_is_empty!7069))

(assert (=> start!33972 tp!24870))

(declare-fun e!207571 () Bool)

(declare-fun array_inv!6246 (array!17715) Bool)

(assert (=> start!33972 (and (array_inv!6246 _values!1525) e!207571)))

(declare-fun array_inv!6247 (array!17717) Bool)

(assert (=> start!33972 (array_inv!6247 _keys!1895)))

(declare-fun b!338310 () Bool)

(declare-fun res!186904 () Bool)

(assert (=> b!338310 (=> (not res!186904) (not e!207569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17717 (_ BitVec 32)) Bool)

(assert (=> b!338310 (= res!186904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338311 () Bool)

(declare-fun res!186902 () Bool)

(assert (=> b!338311 (=> (not res!186902) (not e!207569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338311 (= res!186902 (validKeyInArray!0 k0!1348))))

(declare-fun b!338312 () Bool)

(declare-datatypes ((Unit!10500 0))(
  ( (Unit!10501) )
))
(declare-fun e!207567 () Unit!10500)

(declare-fun Unit!10502 () Unit!10500)

(assert (=> b!338312 (= e!207567 Unit!10502)))

(declare-fun b!338313 () Bool)

(declare-fun e!207566 () Bool)

(assert (=> b!338313 (= e!207566 tp_is_empty!7069)))

(declare-fun mapNonEmpty!12015 () Bool)

(declare-fun mapRes!12015 () Bool)

(declare-fun tp!24869 () Bool)

(declare-fun e!207568 () Bool)

(assert (=> mapNonEmpty!12015 (= mapRes!12015 (and tp!24869 e!207568))))

(declare-fun mapKey!12015 () (_ BitVec 32))

(declare-fun mapValue!12015 () ValueCell!3191)

(declare-fun mapRest!12015 () (Array (_ BitVec 32) ValueCell!3191))

(assert (=> mapNonEmpty!12015 (= (arr!8383 _values!1525) (store mapRest!12015 mapKey!12015 mapValue!12015))))

(declare-fun b!338314 () Bool)

(declare-fun res!186908 () Bool)

(assert (=> b!338314 (=> (not res!186908) (not e!207569))))

(assert (=> b!338314 (= res!186908 (and (= (size!8736 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8737 _keys!1895) (size!8736 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338315 () Bool)

(declare-fun e!207565 () Bool)

(assert (=> b!338315 (= e!207565 false)))

(declare-fun lt!160616 () Unit!10500)

(assert (=> b!338315 (= lt!160616 e!207567)))

(declare-fun c!52364 () Bool)

(declare-fun arrayContainsKey!0 (array!17717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338315 (= c!52364 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!338316 () Bool)

(assert (=> b!338316 (= e!207571 (and e!207566 mapRes!12015))))

(declare-fun condMapEmpty!12015 () Bool)

(declare-fun mapDefault!12015 () ValueCell!3191)

(assert (=> b!338316 (= condMapEmpty!12015 (= (arr!8383 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3191)) mapDefault!12015)))))

(declare-fun b!338317 () Bool)

(declare-fun res!186907 () Bool)

(assert (=> b!338317 (=> (not res!186907) (not e!207569))))

(declare-datatypes ((List!4771 0))(
  ( (Nil!4768) (Cons!4767 (h!5623 (_ BitVec 64)) (t!9860 List!4771)) )
))
(declare-fun arrayNoDuplicates!0 (array!17717 (_ BitVec 32) List!4771) Bool)

(assert (=> b!338317 (= res!186907 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4768))))

(declare-fun mapIsEmpty!12015 () Bool)

(assert (=> mapIsEmpty!12015 mapRes!12015))

(declare-fun b!338318 () Bool)

(assert (=> b!338318 (= e!207569 e!207565)))

(declare-fun res!186903 () Bool)

(assert (=> b!338318 (=> (not res!186903) (not e!207565))))

(declare-datatypes ((SeekEntryResult!3236 0))(
  ( (MissingZero!3236 (index!15123 (_ BitVec 32))) (Found!3236 (index!15124 (_ BitVec 32))) (Intermediate!3236 (undefined!4048 Bool) (index!15125 (_ BitVec 32)) (x!33727 (_ BitVec 32))) (Undefined!3236) (MissingVacant!3236 (index!15126 (_ BitVec 32))) )
))
(declare-fun lt!160615 () SeekEntryResult!3236)

(get-info :version)

(assert (=> b!338318 (= res!186903 (and (not ((_ is Found!3236) lt!160615)) ((_ is MissingZero!3236) lt!160615)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17717 (_ BitVec 32)) SeekEntryResult!3236)

(assert (=> b!338318 (= lt!160615 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338319 () Bool)

(declare-fun Unit!10503 () Unit!10500)

(assert (=> b!338319 (= e!207567 Unit!10503)))

(declare-fun lt!160617 () Unit!10500)

(declare-fun lemmaArrayContainsKeyThenInListMap!277 (array!17717 array!17715 (_ BitVec 32) (_ BitVec 32) V!10403 V!10403 (_ BitVec 64) (_ BitVec 32) Int) Unit!10500)

(declare-fun arrayScanForKey!0 (array!17717 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338319 (= lt!160617 (lemmaArrayContainsKeyThenInListMap!277 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338319 false))

(declare-fun b!338320 () Bool)

(assert (=> b!338320 (= e!207568 tp_is_empty!7069)))

(assert (= (and start!33972 res!186905) b!338314))

(assert (= (and b!338314 res!186908) b!338310))

(assert (= (and b!338310 res!186904) b!338317))

(assert (= (and b!338317 res!186907) b!338311))

(assert (= (and b!338311 res!186902) b!338309))

(assert (= (and b!338309 res!186906) b!338318))

(assert (= (and b!338318 res!186903) b!338315))

(assert (= (and b!338315 c!52364) b!338319))

(assert (= (and b!338315 (not c!52364)) b!338312))

(assert (= (and b!338316 condMapEmpty!12015) mapIsEmpty!12015))

(assert (= (and b!338316 (not condMapEmpty!12015)) mapNonEmpty!12015))

(assert (= (and mapNonEmpty!12015 ((_ is ValueCellFull!3191) mapValue!12015)) b!338320))

(assert (= (and b!338316 ((_ is ValueCellFull!3191) mapDefault!12015)) b!338313))

(assert (= start!33972 b!338316))

(declare-fun m!341065 () Bool)

(assert (=> b!338315 m!341065))

(declare-fun m!341067 () Bool)

(assert (=> mapNonEmpty!12015 m!341067))

(declare-fun m!341069 () Bool)

(assert (=> b!338309 m!341069))

(assert (=> b!338309 m!341069))

(declare-fun m!341071 () Bool)

(assert (=> b!338309 m!341071))

(declare-fun m!341073 () Bool)

(assert (=> start!33972 m!341073))

(declare-fun m!341075 () Bool)

(assert (=> start!33972 m!341075))

(declare-fun m!341077 () Bool)

(assert (=> start!33972 m!341077))

(declare-fun m!341079 () Bool)

(assert (=> b!338319 m!341079))

(assert (=> b!338319 m!341079))

(declare-fun m!341081 () Bool)

(assert (=> b!338319 m!341081))

(declare-fun m!341083 () Bool)

(assert (=> b!338311 m!341083))

(declare-fun m!341085 () Bool)

(assert (=> b!338310 m!341085))

(declare-fun m!341087 () Bool)

(assert (=> b!338318 m!341087))

(declare-fun m!341089 () Bool)

(assert (=> b!338317 m!341089))

(check-sat (not b_next!7117) (not start!33972) (not b!338319) tp_is_empty!7069 (not mapNonEmpty!12015) (not b!338309) (not b!338317) (not b!338310) (not b!338318) (not b!338315) b_and!14281 (not b!338311))
(check-sat b_and!14281 (not b_next!7117))
