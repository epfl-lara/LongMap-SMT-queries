; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42018 () Bool)

(assert start!42018)

(declare-fun b_free!11591 () Bool)

(declare-fun b_next!11591 () Bool)

(assert (=> start!42018 (= b_free!11591 (not b_next!11591))))

(declare-fun tp!40789 () Bool)

(declare-fun b_and!19989 () Bool)

(assert (=> start!42018 (= tp!40789 b_and!19989)))

(declare-fun b!469146 () Bool)

(declare-fun e!274682 () Bool)

(declare-fun e!274685 () Bool)

(assert (=> b!469146 (= e!274682 (not e!274685))))

(declare-fun res!280375 () Bool)

(assert (=> b!469146 (=> res!280375 e!274685)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469146 (= res!280375 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18463 0))(
  ( (V!18464 (val!6554 Int)) )
))
(declare-datatypes ((tuple2!8622 0))(
  ( (tuple2!8623 (_1!4322 (_ BitVec 64)) (_2!4322 V!18463)) )
))
(declare-datatypes ((List!8703 0))(
  ( (Nil!8700) (Cons!8699 (h!9555 tuple2!8622) (t!14661 List!8703)) )
))
(declare-datatypes ((ListLongMap!7535 0))(
  ( (ListLongMap!7536 (toList!3783 List!8703)) )
))
(declare-fun lt!212459 () ListLongMap!7535)

(declare-fun lt!212462 () ListLongMap!7535)

(assert (=> b!469146 (= lt!212459 lt!212462)))

(declare-fun minValueBefore!38 () V!18463)

(declare-fun zeroValue!794 () V!18463)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29809 0))(
  ( (array!29810 (arr!14330 (Array (_ BitVec 32) (_ BitVec 64))) (size!14682 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29809)

(declare-datatypes ((ValueCell!6166 0))(
  ( (ValueCellFull!6166 (v!8843 V!18463)) (EmptyCell!6166) )
))
(declare-datatypes ((array!29811 0))(
  ( (array!29812 (arr!14331 (Array (_ BitVec 32) ValueCell!6166)) (size!14683 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29811)

(declare-fun minValueAfter!38 () V!18463)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((Unit!13721 0))(
  ( (Unit!13722) )
))
(declare-fun lt!212460 () Unit!13721)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!132 (array!29809 array!29811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18463 V!18463 V!18463 V!18463 (_ BitVec 32) Int) Unit!13721)

(assert (=> b!469146 (= lt!212460 (lemmaNoChangeToArrayThenSameMapNoExtras!132 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1952 (array!29809 array!29811 (_ BitVec 32) (_ BitVec 32) V!18463 V!18463 (_ BitVec 32) Int) ListLongMap!7535)

(assert (=> b!469146 (= lt!212462 (getCurrentListMapNoExtraKeys!1952 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469146 (= lt!212459 (getCurrentListMapNoExtraKeys!1952 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21223 () Bool)

(declare-fun mapRes!21223 () Bool)

(assert (=> mapIsEmpty!21223 mapRes!21223))

(declare-fun b!469147 () Bool)

(declare-fun res!280378 () Bool)

(assert (=> b!469147 (=> (not res!280378) (not e!274682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29809 (_ BitVec 32)) Bool)

(assert (=> b!469147 (= res!280378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469148 () Bool)

(declare-fun e!274683 () Bool)

(declare-fun tp_is_empty!13019 () Bool)

(assert (=> b!469148 (= e!274683 tp_is_empty!13019)))

(declare-fun res!280376 () Bool)

(assert (=> start!42018 (=> (not res!280376) (not e!274682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42018 (= res!280376 (validMask!0 mask!1365))))

(assert (=> start!42018 e!274682))

(assert (=> start!42018 tp_is_empty!13019))

(assert (=> start!42018 tp!40789))

(assert (=> start!42018 true))

(declare-fun array_inv!10342 (array!29809) Bool)

(assert (=> start!42018 (array_inv!10342 _keys!1025)))

(declare-fun e!274680 () Bool)

(declare-fun array_inv!10343 (array!29811) Bool)

(assert (=> start!42018 (and (array_inv!10343 _values!833) e!274680)))

(declare-fun b!469149 () Bool)

(declare-fun res!280377 () Bool)

(assert (=> b!469149 (=> (not res!280377) (not e!274682))))

(declare-datatypes ((List!8704 0))(
  ( (Nil!8701) (Cons!8700 (h!9556 (_ BitVec 64)) (t!14662 List!8704)) )
))
(declare-fun arrayNoDuplicates!0 (array!29809 (_ BitVec 32) List!8704) Bool)

(assert (=> b!469149 (= res!280377 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8701))))

(declare-fun mapNonEmpty!21223 () Bool)

(declare-fun tp!40788 () Bool)

(assert (=> mapNonEmpty!21223 (= mapRes!21223 (and tp!40788 e!274683))))

(declare-fun mapRest!21223 () (Array (_ BitVec 32) ValueCell!6166))

(declare-fun mapValue!21223 () ValueCell!6166)

(declare-fun mapKey!21223 () (_ BitVec 32))

(assert (=> mapNonEmpty!21223 (= (arr!14331 _values!833) (store mapRest!21223 mapKey!21223 mapValue!21223))))

(declare-fun b!469150 () Bool)

(declare-fun e!274681 () Bool)

(assert (=> b!469150 (= e!274680 (and e!274681 mapRes!21223))))

(declare-fun condMapEmpty!21223 () Bool)

(declare-fun mapDefault!21223 () ValueCell!6166)

