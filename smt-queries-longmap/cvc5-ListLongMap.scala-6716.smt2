; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84268 () Bool)

(assert start!84268)

(declare-fun mapNonEmpty!36635 () Bool)

(declare-fun mapRes!36635 () Bool)

(declare-fun tp!69490 () Bool)

(declare-fun e!555743 () Bool)

(assert (=> mapNonEmpty!36635 (= mapRes!36635 (and tp!69490 e!555743))))

(declare-fun mapKey!36635 () (_ BitVec 32))

(declare-datatypes ((V!35745 0))(
  ( (V!35746 (val!11586 Int)) )
))
(declare-datatypes ((ValueCell!11054 0))(
  ( (ValueCellFull!11054 (v!14148 V!35745)) (EmptyCell!11054) )
))
(declare-datatypes ((array!62115 0))(
  ( (array!62116 (arr!29915 (Array (_ BitVec 32) ValueCell!11054)) (size!30394 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62115)

(declare-fun mapRest!36635 () (Array (_ BitVec 32) ValueCell!11054))

(declare-fun mapValue!36635 () ValueCell!11054)

(assert (=> mapNonEmpty!36635 (= (arr!29915 _values!1278) (store mapRest!36635 mapKey!36635 mapValue!36635))))

(declare-fun b!985885 () Bool)

(declare-fun e!555746 () Bool)

(assert (=> b!985885 (= e!555746 false)))

(declare-fun lt!437402 () Bool)

(declare-datatypes ((array!62117 0))(
  ( (array!62118 (arr!29916 (Array (_ BitVec 32) (_ BitVec 64))) (size!30395 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62117)

(declare-datatypes ((List!20719 0))(
  ( (Nil!20716) (Cons!20715 (h!21877 (_ BitVec 64)) (t!29618 List!20719)) )
))
(declare-fun arrayNoDuplicates!0 (array!62117 (_ BitVec 32) List!20719) Bool)

(assert (=> b!985885 (= lt!437402 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20716))))

(declare-fun b!985886 () Bool)

(declare-fun tp_is_empty!23071 () Bool)

(assert (=> b!985886 (= e!555743 tp_is_empty!23071)))

(declare-fun b!985887 () Bool)

(declare-fun e!555747 () Bool)

(declare-fun e!555744 () Bool)

(assert (=> b!985887 (= e!555747 (and e!555744 mapRes!36635))))

(declare-fun condMapEmpty!36635 () Bool)

(declare-fun mapDefault!36635 () ValueCell!11054)

