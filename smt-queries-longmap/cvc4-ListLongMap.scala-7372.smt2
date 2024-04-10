; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93954 () Bool)

(assert start!93954)

(declare-fun b_free!21413 () Bool)

(declare-fun b_next!21413 () Bool)

(assert (=> start!93954 (= b_free!21413 (not b_next!21413))))

(declare-fun tp!75665 () Bool)

(declare-fun b_and!34135 () Bool)

(assert (=> start!93954 (= tp!75665 b_and!34135)))

(declare-fun b!1062652 () Bool)

(declare-fun e!605354 () Bool)

(declare-fun e!605357 () Bool)

(assert (=> b!1062652 (= e!605354 e!605357)))

(declare-fun res!709571 () Bool)

(assert (=> b!1062652 (=> res!709571 e!605357)))

(declare-datatypes ((V!38765 0))(
  ( (V!38766 (val!12662 Int)) )
))
(declare-datatypes ((tuple2!16024 0))(
  ( (tuple2!16025 (_1!8023 (_ BitVec 64)) (_2!8023 V!38765)) )
))
(declare-datatypes ((List!22605 0))(
  ( (Nil!22602) (Cons!22601 (h!23810 tuple2!16024) (t!31916 List!22605)) )
))
(declare-datatypes ((ListLongMap!13993 0))(
  ( (ListLongMap!13994 (toList!7012 List!22605)) )
))
(declare-fun lt!468221 () ListLongMap!13993)

(declare-fun contains!6243 (ListLongMap!13993 (_ BitVec 64)) Bool)

(assert (=> b!1062652 (= res!709571 (contains!6243 lt!468221 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38765)

(declare-datatypes ((ValueCell!11908 0))(
  ( (ValueCellFull!11908 (v!15272 V!38765)) (EmptyCell!11908) )
))
(declare-datatypes ((array!67449 0))(
  ( (array!67450 (arr!32431 (Array (_ BitVec 32) ValueCell!11908)) (size!32967 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67449)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38765)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67451 0))(
  ( (array!67452 (arr!32432 (Array (_ BitVec 32) (_ BitVec 64))) (size!32968 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67451)

(declare-fun getCurrentListMap!3996 (array!67451 array!67449 (_ BitVec 32) (_ BitVec 32) V!38765 V!38765 (_ BitVec 32) Int) ListLongMap!13993)

(assert (=> b!1062652 (= lt!468221 (getCurrentListMap!3996 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062653 () Bool)

(declare-fun e!605359 () Bool)

(assert (=> b!1062653 (= e!605359 (not e!605354))))

(declare-fun res!709572 () Bool)

(assert (=> b!1062653 (=> res!709572 e!605354)))

(assert (=> b!1062653 (= res!709572 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468219 () ListLongMap!13993)

(declare-fun lt!468220 () ListLongMap!13993)

(assert (=> b!1062653 (= lt!468219 lt!468220)))

(declare-datatypes ((Unit!34822 0))(
  ( (Unit!34823) )
))
(declare-fun lt!468217 () Unit!34822)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!38765)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!643 (array!67451 array!67449 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38765 V!38765 V!38765 V!38765 (_ BitVec 32) Int) Unit!34822)

(assert (=> b!1062653 (= lt!468217 (lemmaNoChangeToArrayThenSameMapNoExtras!643 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3606 (array!67451 array!67449 (_ BitVec 32) (_ BitVec 32) V!38765 V!38765 (_ BitVec 32) Int) ListLongMap!13993)

(assert (=> b!1062653 (= lt!468220 (getCurrentListMapNoExtraKeys!3606 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062653 (= lt!468219 (getCurrentListMapNoExtraKeys!3606 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062654 () Bool)

(declare-fun e!605358 () Bool)

(declare-fun e!605355 () Bool)

(declare-fun mapRes!39508 () Bool)

(assert (=> b!1062654 (= e!605358 (and e!605355 mapRes!39508))))

(declare-fun condMapEmpty!39508 () Bool)

(declare-fun mapDefault!39508 () ValueCell!11908)

