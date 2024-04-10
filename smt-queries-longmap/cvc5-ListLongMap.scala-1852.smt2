; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33480 () Bool)

(assert start!33480)

(declare-fun b!332307 () Bool)

(declare-fun e!204032 () Bool)

(declare-fun tp_is_empty!6733 () Bool)

(assert (=> b!332307 (= e!204032 tp_is_empty!6733)))

(declare-fun mapIsEmpty!11484 () Bool)

(declare-fun mapRes!11484 () Bool)

(assert (=> mapIsEmpty!11484 mapRes!11484))

(declare-fun b!332308 () Bool)

(declare-fun res!183066 () Bool)

(declare-fun e!204035 () Bool)

(assert (=> b!332308 (=> (not res!183066) (not e!204035))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!9955 0))(
  ( (V!9956 (val!3411 Int)) )
))
(declare-datatypes ((ValueCell!3023 0))(
  ( (ValueCellFull!3023 (v!5570 V!9955)) (EmptyCell!3023) )
))
(declare-datatypes ((array!17061 0))(
  ( (array!17062 (arr!8065 (Array (_ BitVec 32) ValueCell!3023)) (size!8417 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17061)

(declare-datatypes ((array!17063 0))(
  ( (array!17064 (arr!8066 (Array (_ BitVec 32) (_ BitVec 64))) (size!8418 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17063)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332308 (= res!183066 (and (= (size!8417 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8418 _keys!1895) (size!8417 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!332309 () Bool)

(declare-fun res!183067 () Bool)

(assert (=> b!332309 (=> (not res!183067) (not e!204035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17063 (_ BitVec 32)) Bool)

(assert (=> b!332309 (= res!183067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!332310 () Bool)

(declare-fun e!204033 () Bool)

(assert (=> b!332310 (= e!204033 tp_is_empty!6733)))

(declare-fun mapNonEmpty!11484 () Bool)

(declare-fun tp!23859 () Bool)

(assert (=> mapNonEmpty!11484 (= mapRes!11484 (and tp!23859 e!204033))))

(declare-fun mapKey!11484 () (_ BitVec 32))

(declare-fun mapValue!11484 () ValueCell!3023)

(declare-fun mapRest!11484 () (Array (_ BitVec 32) ValueCell!3023))

(assert (=> mapNonEmpty!11484 (= (arr!8065 _values!1525) (store mapRest!11484 mapKey!11484 mapValue!11484))))

(declare-fun res!183068 () Bool)

(assert (=> start!33480 (=> (not res!183068) (not e!204035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33480 (= res!183068 (validMask!0 mask!2385))))

(assert (=> start!33480 e!204035))

(assert (=> start!33480 true))

(declare-fun e!204036 () Bool)

(declare-fun array_inv!6008 (array!17061) Bool)

(assert (=> start!33480 (and (array_inv!6008 _values!1525) e!204036)))

(declare-fun array_inv!6009 (array!17063) Bool)

(assert (=> start!33480 (array_inv!6009 _keys!1895)))

(declare-fun b!332311 () Bool)

(assert (=> b!332311 (= e!204036 (and e!204032 mapRes!11484))))

(declare-fun condMapEmpty!11484 () Bool)

(declare-fun mapDefault!11484 () ValueCell!3023)

