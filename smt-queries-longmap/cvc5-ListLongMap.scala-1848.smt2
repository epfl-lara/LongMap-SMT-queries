; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33456 () Bool)

(assert start!33456)

(declare-fun mapNonEmpty!11448 () Bool)

(declare-fun mapRes!11448 () Bool)

(declare-fun tp!23823 () Bool)

(declare-fun e!203852 () Bool)

(assert (=> mapNonEmpty!11448 (= mapRes!11448 (and tp!23823 e!203852))))

(declare-datatypes ((V!9923 0))(
  ( (V!9924 (val!3399 Int)) )
))
(declare-datatypes ((ValueCell!3011 0))(
  ( (ValueCellFull!3011 (v!5558 V!9923)) (EmptyCell!3011) )
))
(declare-fun mapValue!11448 () ValueCell!3011)

(declare-datatypes ((array!17015 0))(
  ( (array!17016 (arr!8042 (Array (_ BitVec 32) ValueCell!3011)) (size!8394 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17015)

(declare-fun mapRest!11448 () (Array (_ BitVec 32) ValueCell!3011))

(declare-fun mapKey!11448 () (_ BitVec 32))

(assert (=> mapNonEmpty!11448 (= (arr!8042 _values!1525) (store mapRest!11448 mapKey!11448 mapValue!11448))))

(declare-fun b!332091 () Bool)

(declare-fun tp_is_empty!6709 () Bool)

(assert (=> b!332091 (= e!203852 tp_is_empty!6709)))

(declare-fun b!332092 () Bool)

(declare-fun res!182958 () Bool)

(declare-fun e!203855 () Bool)

(assert (=> b!332092 (=> (not res!182958) (not e!203855))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17017 0))(
  ( (array!17018 (arr!8043 (Array (_ BitVec 32) (_ BitVec 64))) (size!8395 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17017)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332092 (= res!182958 (and (= (size!8394 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8395 _keys!1895) (size!8394 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332093 () Bool)

(declare-fun res!182959 () Bool)

(assert (=> b!332093 (=> (not res!182959) (not e!203855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17017 (_ BitVec 32)) Bool)

(assert (=> b!332093 (= res!182959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!182960 () Bool)

(assert (=> start!33456 (=> (not res!182960) (not e!203855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33456 (= res!182960 (validMask!0 mask!2385))))

(assert (=> start!33456 e!203855))

(assert (=> start!33456 true))

(declare-fun e!203856 () Bool)

(declare-fun array_inv!5988 (array!17015) Bool)

(assert (=> start!33456 (and (array_inv!5988 _values!1525) e!203856)))

(declare-fun array_inv!5989 (array!17017) Bool)

(assert (=> start!33456 (array_inv!5989 _keys!1895)))

(declare-fun b!332094 () Bool)

(declare-fun e!203853 () Bool)

(assert (=> b!332094 (= e!203856 (and e!203853 mapRes!11448))))

(declare-fun condMapEmpty!11448 () Bool)

(declare-fun mapDefault!11448 () ValueCell!3011)

