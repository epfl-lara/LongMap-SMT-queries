; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95132 () Bool)

(assert start!95132)

(declare-fun b_free!22211 () Bool)

(declare-fun b_next!22211 () Bool)

(assert (=> start!95132 (= b_free!22211 (not b_next!22211))))

(declare-fun tp!78118 () Bool)

(declare-fun b_and!35141 () Bool)

(assert (=> start!95132 (= tp!78118 b_and!35141)))

(declare-fun mapNonEmpty!40765 () Bool)

(declare-fun mapRes!40765 () Bool)

(declare-fun tp!78119 () Bool)

(declare-fun e!614607 () Bool)

(assert (=> mapNonEmpty!40765 (= mapRes!40765 (and tp!78119 e!614607))))

(declare-datatypes ((V!39829 0))(
  ( (V!39830 (val!13061 Int)) )
))
(declare-datatypes ((ValueCell!12307 0))(
  ( (ValueCellFull!12307 (v!15685 V!39829)) (EmptyCell!12307) )
))
(declare-fun mapRest!40765 () (Array (_ BitVec 32) ValueCell!12307))

(declare-fun mapKey!40765 () (_ BitVec 32))

(declare-datatypes ((array!69011 0))(
  ( (array!69012 (arr!33192 (Array (_ BitVec 32) ValueCell!12307)) (size!33728 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!69011)

(declare-fun mapValue!40765 () ValueCell!12307)

(assert (=> mapNonEmpty!40765 (= (arr!33192 _values!955) (store mapRest!40765 mapKey!40765 mapValue!40765))))

(declare-fun mapIsEmpty!40765 () Bool)

(assert (=> mapIsEmpty!40765 mapRes!40765))

(declare-fun b!1075396 () Bool)

(declare-fun res!716926 () Bool)

(declare-fun e!614605 () Bool)

(assert (=> b!1075396 (=> (not res!716926) (not e!614605))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!69013 0))(
  ( (array!69014 (arr!33193 (Array (_ BitVec 32) (_ BitVec 64))) (size!33729 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!69013)

(assert (=> b!1075396 (= res!716926 (and (= (size!33728 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33729 _keys!1163) (size!33728 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1075397 () Bool)

(declare-fun res!716923 () Bool)

(assert (=> b!1075397 (=> (not res!716923) (not e!614605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69013 (_ BitVec 32)) Bool)

(assert (=> b!1075397 (= res!716923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1075398 () Bool)

(declare-fun e!614602 () Bool)

(declare-fun e!614604 () Bool)

(assert (=> b!1075398 (= e!614602 (and e!614604 mapRes!40765))))

(declare-fun condMapEmpty!40765 () Bool)

(declare-fun mapDefault!40765 () ValueCell!12307)

