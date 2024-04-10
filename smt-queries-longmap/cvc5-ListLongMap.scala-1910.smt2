; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33998 () Bool)

(assert start!33998)

(declare-fun b_free!7129 () Bool)

(declare-fun b_next!7129 () Bool)

(assert (=> start!33998 (= b_free!7129 (not b_next!7129))))

(declare-fun tp!24905 () Bool)

(declare-fun b_and!14319 () Bool)

(assert (=> start!33998 (= tp!24905 b_and!14319)))

(declare-fun b!338804 () Bool)

(declare-fun e!207876 () Bool)

(declare-fun tp_is_empty!7081 () Bool)

(assert (=> b!338804 (= e!207876 tp_is_empty!7081)))

(declare-fun b!338805 () Bool)

(declare-fun e!207874 () Bool)

(declare-datatypes ((array!17757 0))(
  ( (array!17758 (arr!8404 (Array (_ BitVec 32) (_ BitVec 64))) (size!8756 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17757)

(declare-datatypes ((SeekEntryResult!3246 0))(
  ( (MissingZero!3246 (index!15163 (_ BitVec 32))) (Found!3246 (index!15164 (_ BitVec 32))) (Intermediate!3246 (undefined!4058 Bool) (index!15165 (_ BitVec 32)) (x!33758 (_ BitVec 32))) (Undefined!3246) (MissingVacant!3246 (index!15166 (_ BitVec 32))) )
))
(declare-fun lt!160908 () SeekEntryResult!3246)

(assert (=> b!338805 (= e!207874 (and (= (select (arr!8404 _keys!1895) (index!15163 lt!160908)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!8756 _keys!1895))))))

(declare-fun b!338806 () Bool)

(declare-fun res!187165 () Bool)

(declare-fun e!207873 () Bool)

(assert (=> b!338806 (=> (not res!187165) (not e!207873))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17757 (_ BitVec 32)) Bool)

(assert (=> b!338806 (= res!187165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338807 () Bool)

(declare-fun res!187168 () Bool)

(assert (=> b!338807 (=> (not res!187168) (not e!207873))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10419 0))(
  ( (V!10420 (val!3585 Int)) )
))
(declare-fun zeroValue!1467 () V!10419)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3197 0))(
  ( (ValueCellFull!3197 (v!5752 V!10419)) (EmptyCell!3197) )
))
(declare-datatypes ((array!17759 0))(
  ( (array!17760 (arr!8405 (Array (_ BitVec 32) ValueCell!3197)) (size!8757 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17759)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10419)

(declare-datatypes ((tuple2!5206 0))(
  ( (tuple2!5207 (_1!2614 (_ BitVec 64)) (_2!2614 V!10419)) )
))
(declare-datatypes ((List!4822 0))(
  ( (Nil!4819) (Cons!4818 (h!5674 tuple2!5206) (t!9920 List!4822)) )
))
(declare-datatypes ((ListLongMap!4119 0))(
  ( (ListLongMap!4120 (toList!2075 List!4822)) )
))
(declare-fun contains!2124 (ListLongMap!4119 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1596 (array!17757 array!17759 (_ BitVec 32) (_ BitVec 32) V!10419 V!10419 (_ BitVec 32) Int) ListLongMap!4119)

(assert (=> b!338807 (= res!187168 (not (contains!2124 (getCurrentListMap!1596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!338808 () Bool)

(declare-datatypes ((Unit!10538 0))(
  ( (Unit!10539) )
))
(declare-fun e!207869 () Unit!10538)

(declare-fun Unit!10540 () Unit!10538)

(assert (=> b!338808 (= e!207869 Unit!10540)))

(declare-fun lt!160906 () Unit!10538)

(declare-fun lemmaArrayContainsKeyThenInListMap!278 (array!17757 array!17759 (_ BitVec 32) (_ BitVec 32) V!10419 V!10419 (_ BitVec 64) (_ BitVec 32) Int) Unit!10538)

(declare-fun arrayScanForKey!0 (array!17757 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338808 (= lt!160906 (lemmaArrayContainsKeyThenInListMap!278 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338808 false))

(declare-fun b!338810 () Bool)

(declare-fun res!187167 () Bool)

(assert (=> b!338810 (=> (not res!187167) (not e!207873))))

(assert (=> b!338810 (= res!187167 (and (= (size!8757 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8756 _keys!1895) (size!8757 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338811 () Bool)

(declare-fun e!207871 () Bool)

(assert (=> b!338811 (= e!207871 e!207874)))

(declare-fun res!187162 () Bool)

(assert (=> b!338811 (=> (not res!187162) (not e!207874))))

(declare-fun lt!160907 () Bool)

(assert (=> b!338811 (= res!187162 (not lt!160907))))

(declare-fun lt!160909 () Unit!10538)

(assert (=> b!338811 (= lt!160909 e!207869)))

(declare-fun c!52455 () Bool)

(assert (=> b!338811 (= c!52455 lt!160907)))

(declare-fun arrayContainsKey!0 (array!17757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338811 (= lt!160907 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!12033 () Bool)

(declare-fun mapRes!12033 () Bool)

(declare-fun tp!24906 () Bool)

(assert (=> mapNonEmpty!12033 (= mapRes!12033 (and tp!24906 e!207876))))

(declare-fun mapKey!12033 () (_ BitVec 32))

(declare-fun mapValue!12033 () ValueCell!3197)

(declare-fun mapRest!12033 () (Array (_ BitVec 32) ValueCell!3197))

(assert (=> mapNonEmpty!12033 (= (arr!8405 _values!1525) (store mapRest!12033 mapKey!12033 mapValue!12033))))

(declare-fun b!338812 () Bool)

(declare-fun res!187161 () Bool)

(assert (=> b!338812 (=> (not res!187161) (not e!207874))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!338812 (= res!187161 (inRange!0 (index!15163 lt!160908) mask!2385))))

(declare-fun b!338809 () Bool)

(declare-fun res!187164 () Bool)

(assert (=> b!338809 (=> (not res!187164) (not e!207873))))

(declare-datatypes ((List!4823 0))(
  ( (Nil!4820) (Cons!4819 (h!5675 (_ BitVec 64)) (t!9921 List!4823)) )
))
(declare-fun arrayNoDuplicates!0 (array!17757 (_ BitVec 32) List!4823) Bool)

(assert (=> b!338809 (= res!187164 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4820))))

(declare-fun res!187166 () Bool)

(assert (=> start!33998 (=> (not res!187166) (not e!207873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33998 (= res!187166 (validMask!0 mask!2385))))

(assert (=> start!33998 e!207873))

(assert (=> start!33998 true))

(assert (=> start!33998 tp_is_empty!7081))

(assert (=> start!33998 tp!24905))

(declare-fun e!207875 () Bool)

(declare-fun array_inv!6230 (array!17759) Bool)

(assert (=> start!33998 (and (array_inv!6230 _values!1525) e!207875)))

(declare-fun array_inv!6231 (array!17757) Bool)

(assert (=> start!33998 (array_inv!6231 _keys!1895)))

(declare-fun b!338813 () Bool)

(assert (=> b!338813 (= e!207873 e!207871)))

(declare-fun res!187163 () Bool)

(assert (=> b!338813 (=> (not res!187163) (not e!207871))))

(assert (=> b!338813 (= res!187163 (and (not (is-Found!3246 lt!160908)) (is-MissingZero!3246 lt!160908)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17757 (_ BitVec 32)) SeekEntryResult!3246)

(assert (=> b!338813 (= lt!160908 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!338814 () Bool)

(declare-fun e!207872 () Bool)

(assert (=> b!338814 (= e!207875 (and e!207872 mapRes!12033))))

(declare-fun condMapEmpty!12033 () Bool)

(declare-fun mapDefault!12033 () ValueCell!3197)

