; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84552 () Bool)

(assert start!84552)

(declare-fun b_free!20033 () Bool)

(declare-fun b_next!20033 () Bool)

(assert (=> start!84552 (= b_free!20033 (not b_next!20033))))

(declare-fun tp!69887 () Bool)

(declare-fun b_and!32135 () Bool)

(assert (=> start!84552 (= tp!69887 b_and!32135)))

(declare-fun b!988907 () Bool)

(declare-fun res!661404 () Bool)

(declare-fun e!557621 () Bool)

(assert (=> b!988907 (=> (not res!661404) (not e!557621))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!988907 (= res!661404 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988908 () Bool)

(declare-fun e!557624 () Bool)

(declare-fun tp_is_empty!23249 () Bool)

(assert (=> b!988908 (= e!557624 tp_is_empty!23249)))

(declare-fun mapNonEmpty!36915 () Bool)

(declare-fun mapRes!36915 () Bool)

(declare-fun tp!69886 () Bool)

(declare-fun e!557622 () Bool)

(assert (=> mapNonEmpty!36915 (= mapRes!36915 (and tp!69886 e!557622))))

(declare-datatypes ((V!35981 0))(
  ( (V!35982 (val!11675 Int)) )
))
(declare-datatypes ((ValueCell!11143 0))(
  ( (ValueCellFull!11143 (v!14242 V!35981)) (EmptyCell!11143) )
))
(declare-fun mapValue!36915 () ValueCell!11143)

(declare-datatypes ((array!62459 0))(
  ( (array!62460 (arr!30083 (Array (_ BitVec 32) ValueCell!11143)) (size!30562 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62459)

(declare-fun mapRest!36915 () (Array (_ BitVec 32) ValueCell!11143))

(declare-fun mapKey!36915 () (_ BitVec 32))

(assert (=> mapNonEmpty!36915 (= (arr!30083 _values!1278) (store mapRest!36915 mapKey!36915 mapValue!36915))))

(declare-fun b!988909 () Bool)

(declare-fun e!557623 () Bool)

(assert (=> b!988909 (= e!557623 (and e!557624 mapRes!36915))))

(declare-fun condMapEmpty!36915 () Bool)

(declare-fun mapDefault!36915 () ValueCell!11143)

