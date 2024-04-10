; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33430 () Bool)

(assert start!33430)

(declare-fun mapNonEmpty!11424 () Bool)

(declare-fun mapRes!11424 () Bool)

(declare-fun tp!23799 () Bool)

(declare-fun e!203721 () Bool)

(assert (=> mapNonEmpty!11424 (= mapRes!11424 (and tp!23799 e!203721))))

(declare-datatypes ((V!9903 0))(
  ( (V!9904 (val!3392 Int)) )
))
(declare-datatypes ((ValueCell!3004 0))(
  ( (ValueCellFull!3004 (v!5550 V!9903)) (EmptyCell!3004) )
))
(declare-fun mapRest!11424 () (Array (_ BitVec 32) ValueCell!3004))

(declare-fun mapValue!11424 () ValueCell!3004)

(declare-datatypes ((array!16989 0))(
  ( (array!16990 (arr!8030 (Array (_ BitVec 32) ValueCell!3004)) (size!8382 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16989)

(declare-fun mapKey!11424 () (_ BitVec 32))

(assert (=> mapNonEmpty!11424 (= (arr!8030 _values!1525) (store mapRest!11424 mapKey!11424 mapValue!11424))))

(declare-fun b!331928 () Bool)

(declare-fun e!203719 () Bool)

(declare-fun e!203718 () Bool)

(assert (=> b!331928 (= e!203719 e!203718)))

(declare-fun res!182874 () Bool)

(assert (=> b!331928 (=> res!182874 e!203718)))

(declare-datatypes ((List!4578 0))(
  ( (Nil!4575) (Cons!4574 (h!5430 (_ BitVec 64)) (t!9660 List!4578)) )
))
(declare-fun contains!2002 (List!4578 (_ BitVec 64)) Bool)

(assert (=> b!331928 (= res!182874 (contains!2002 Nil!4575 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!11424 () Bool)

(assert (=> mapIsEmpty!11424 mapRes!11424))

(declare-fun b!331929 () Bool)

(declare-fun e!203720 () Bool)

(declare-fun tp_is_empty!6695 () Bool)

(assert (=> b!331929 (= e!203720 tp_is_empty!6695)))

(declare-fun b!331930 () Bool)

(declare-fun res!182872 () Bool)

(assert (=> b!331930 (=> (not res!182872) (not e!203719))))

(declare-fun noDuplicate!176 (List!4578) Bool)

(assert (=> b!331930 (= res!182872 (noDuplicate!176 Nil!4575))))

(declare-fun b!331931 () Bool)

(declare-fun res!182875 () Bool)

(assert (=> b!331931 (=> (not res!182875) (not e!203719))))

(declare-datatypes ((array!16991 0))(
  ( (array!16992 (arr!8031 (Array (_ BitVec 32) (_ BitVec 64))) (size!8383 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16991)

(assert (=> b!331931 (= res!182875 (and (bvsle #b00000000000000000000000000000000 (size!8383 _keys!1895)) (bvslt (size!8383 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!331932 () Bool)

(declare-fun res!182877 () Bool)

(assert (=> b!331932 (=> (not res!182877) (not e!203719))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!331932 (= res!182877 (and (= (size!8382 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8383 _keys!1895) (size!8382 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!331934 () Bool)

(assert (=> b!331934 (= e!203718 (contains!2002 Nil!4575 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331935 () Bool)

(declare-fun res!182876 () Bool)

(assert (=> b!331935 (=> (not res!182876) (not e!203719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16991 (_ BitVec 32)) Bool)

(assert (=> b!331935 (= res!182876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331936 () Bool)

(assert (=> b!331936 (= e!203721 tp_is_empty!6695)))

(declare-fun b!331933 () Bool)

(declare-fun e!203717 () Bool)

(assert (=> b!331933 (= e!203717 (and e!203720 mapRes!11424))))

(declare-fun condMapEmpty!11424 () Bool)

(declare-fun mapDefault!11424 () ValueCell!3004)

