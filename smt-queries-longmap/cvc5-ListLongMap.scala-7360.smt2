; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93864 () Bool)

(assert start!93864)

(declare-fun b_free!21337 () Bool)

(declare-fun b_next!21337 () Bool)

(assert (=> start!93864 (= b_free!21337 (not b_next!21337))))

(declare-fun tp!75433 () Bool)

(declare-fun b_and!34051 () Bool)

(assert (=> start!93864 (= tp!75433 b_and!34051)))

(declare-fun b!1061601 () Bool)

(declare-fun e!604562 () Bool)

(declare-fun tp_is_empty!25147 () Bool)

(assert (=> b!1061601 (= e!604562 tp_is_empty!25147)))

(declare-fun b!1061602 () Bool)

(declare-fun e!604560 () Bool)

(assert (=> b!1061602 (= e!604560 (not true))))

(declare-datatypes ((V!38665 0))(
  ( (V!38666 (val!12624 Int)) )
))
(declare-datatypes ((tuple2!15958 0))(
  ( (tuple2!15959 (_1!7990 (_ BitVec 64)) (_2!7990 V!38665)) )
))
(declare-datatypes ((List!22544 0))(
  ( (Nil!22541) (Cons!22540 (h!23749 tuple2!15958) (t!31853 List!22544)) )
))
(declare-datatypes ((ListLongMap!13927 0))(
  ( (ListLongMap!13928 (toList!6979 List!22544)) )
))
(declare-fun lt!467666 () ListLongMap!13927)

(declare-fun lt!467667 () ListLongMap!13927)

(assert (=> b!1061602 (= lt!467666 lt!467667)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38665)

(declare-datatypes ((Unit!34760 0))(
  ( (Unit!34761) )
))
(declare-fun lt!467668 () Unit!34760)

(declare-datatypes ((ValueCell!11870 0))(
  ( (ValueCellFull!11870 (v!15234 V!38665)) (EmptyCell!11870) )
))
(declare-datatypes ((array!67297 0))(
  ( (array!67298 (arr!32356 (Array (_ BitVec 32) ValueCell!11870)) (size!32892 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67297)

(declare-fun minValue!907 () V!38665)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38665)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67299 0))(
  ( (array!67300 (arr!32357 (Array (_ BitVec 32) (_ BitVec 64))) (size!32893 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67299)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!618 (array!67299 array!67297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38665 V!38665 V!38665 V!38665 (_ BitVec 32) Int) Unit!34760)

(assert (=> b!1061602 (= lt!467668 (lemmaNoChangeToArrayThenSameMapNoExtras!618 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3581 (array!67299 array!67297 (_ BitVec 32) (_ BitVec 32) V!38665 V!38665 (_ BitVec 32) Int) ListLongMap!13927)

(assert (=> b!1061602 (= lt!467667 (getCurrentListMapNoExtraKeys!3581 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061602 (= lt!467666 (getCurrentListMapNoExtraKeys!3581 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061603 () Bool)

(declare-fun e!604563 () Bool)

(assert (=> b!1061603 (= e!604563 tp_is_empty!25147)))

(declare-fun b!1061604 () Bool)

(declare-fun res!708913 () Bool)

(assert (=> b!1061604 (=> (not res!708913) (not e!604560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67299 (_ BitVec 32)) Bool)

(assert (=> b!1061604 (= res!708913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061605 () Bool)

(declare-fun e!604561 () Bool)

(declare-fun mapRes!39391 () Bool)

(assert (=> b!1061605 (= e!604561 (and e!604563 mapRes!39391))))

(declare-fun condMapEmpty!39391 () Bool)

(declare-fun mapDefault!39391 () ValueCell!11870)

