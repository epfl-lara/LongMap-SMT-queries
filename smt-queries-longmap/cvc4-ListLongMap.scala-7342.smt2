; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93748 () Bool)

(assert start!93748)

(declare-fun b_free!21233 () Bool)

(declare-fun b_next!21233 () Bool)

(assert (=> start!93748 (= b_free!21233 (not b_next!21233))))

(declare-fun tp!75119 () Bool)

(declare-fun b_and!33943 () Bool)

(assert (=> start!93748 (= tp!75119 b_and!33943)))

(declare-fun b!1060435 () Bool)

(declare-fun e!603733 () Bool)

(declare-fun tp_is_empty!25043 () Bool)

(assert (=> b!1060435 (= e!603733 tp_is_empty!25043)))

(declare-fun b!1060436 () Bool)

(declare-fun e!603735 () Bool)

(declare-datatypes ((array!67105 0))(
  ( (array!67106 (arr!32261 (Array (_ BitVec 32) (_ BitVec 64))) (size!32797 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67105)

(assert (=> b!1060436 (= e!603735 (bvsgt #b00000000000000000000000000000000 (size!32797 _keys!1163)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38525 0))(
  ( (V!38526 (val!12572 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38525)

(declare-datatypes ((tuple2!15890 0))(
  ( (tuple2!15891 (_1!7956 (_ BitVec 64)) (_2!7956 V!38525)) )
))
(declare-datatypes ((List!22476 0))(
  ( (Nil!22473) (Cons!22472 (h!23681 tuple2!15890) (t!31783 List!22476)) )
))
(declare-datatypes ((ListLongMap!13859 0))(
  ( (ListLongMap!13860 (toList!6945 List!22476)) )
))
(declare-fun lt!467269 () ListLongMap!13859)

(declare-datatypes ((ValueCell!11818 0))(
  ( (ValueCellFull!11818 (v!15182 V!38525)) (EmptyCell!11818) )
))
(declare-datatypes ((array!67107 0))(
  ( (array!67108 (arr!32262 (Array (_ BitVec 32) ValueCell!11818)) (size!32798 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67107)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38525)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3547 (array!67105 array!67107 (_ BitVec 32) (_ BitVec 32) V!38525 V!38525 (_ BitVec 32) Int) ListLongMap!13859)

(assert (=> b!1060436 (= lt!467269 (getCurrentListMapNoExtraKeys!3547 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060437 () Bool)

(declare-fun res!708264 () Bool)

(assert (=> b!1060437 (=> (not res!708264) (not e!603735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67105 (_ BitVec 32)) Bool)

(assert (=> b!1060437 (= res!708264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060438 () Bool)

(declare-fun res!708265 () Bool)

(assert (=> b!1060438 (=> (not res!708265) (not e!603735))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060438 (= res!708265 (and (= (size!32798 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32797 _keys!1163) (size!32798 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39232 () Bool)

(declare-fun mapRes!39232 () Bool)

(declare-fun tp!75118 () Bool)

(assert (=> mapNonEmpty!39232 (= mapRes!39232 (and tp!75118 e!603733))))

(declare-fun mapKey!39232 () (_ BitVec 32))

(declare-fun mapValue!39232 () ValueCell!11818)

(declare-fun mapRest!39232 () (Array (_ BitVec 32) ValueCell!11818))

(assert (=> mapNonEmpty!39232 (= (arr!32262 _values!955) (store mapRest!39232 mapKey!39232 mapValue!39232))))

(declare-fun b!1060439 () Bool)

(declare-fun res!708262 () Bool)

(assert (=> b!1060439 (=> (not res!708262) (not e!603735))))

(declare-datatypes ((List!22477 0))(
  ( (Nil!22474) (Cons!22473 (h!23682 (_ BitVec 64)) (t!31784 List!22477)) )
))
(declare-fun arrayNoDuplicates!0 (array!67105 (_ BitVec 32) List!22477) Bool)

(assert (=> b!1060439 (= res!708262 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22474))))

(declare-fun mapIsEmpty!39232 () Bool)

(assert (=> mapIsEmpty!39232 mapRes!39232))

(declare-fun b!1060440 () Bool)

(declare-fun e!603732 () Bool)

(assert (=> b!1060440 (= e!603732 tp_is_empty!25043)))

(declare-fun b!1060441 () Bool)

(declare-fun e!603731 () Bool)

(assert (=> b!1060441 (= e!603731 (and e!603732 mapRes!39232))))

(declare-fun condMapEmpty!39232 () Bool)

(declare-fun mapDefault!39232 () ValueCell!11818)

