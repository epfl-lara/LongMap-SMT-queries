; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93862 () Bool)

(assert start!93862)

(declare-fun b_free!21335 () Bool)

(declare-fun b_next!21335 () Bool)

(assert (=> start!93862 (= b_free!21335 (not b_next!21335))))

(declare-fun tp!75427 () Bool)

(declare-fun b_and!34049 () Bool)

(assert (=> start!93862 (= tp!75427 b_and!34049)))

(declare-fun b!1061579 () Bool)

(declare-fun e!604546 () Bool)

(declare-fun tp_is_empty!25145 () Bool)

(assert (=> b!1061579 (= e!604546 tp_is_empty!25145)))

(declare-fun res!708904 () Bool)

(declare-fun e!604544 () Bool)

(assert (=> start!93862 (=> (not res!708904) (not e!604544))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93862 (= res!708904 (validMask!0 mask!1515))))

(assert (=> start!93862 e!604544))

(assert (=> start!93862 true))

(assert (=> start!93862 tp_is_empty!25145))

(declare-datatypes ((V!38661 0))(
  ( (V!38662 (val!12623 Int)) )
))
(declare-datatypes ((ValueCell!11869 0))(
  ( (ValueCellFull!11869 (v!15233 V!38661)) (EmptyCell!11869) )
))
(declare-datatypes ((array!67293 0))(
  ( (array!67294 (arr!32354 (Array (_ BitVec 32) ValueCell!11869)) (size!32890 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67293)

(declare-fun e!604547 () Bool)

(declare-fun array_inv!25070 (array!67293) Bool)

(assert (=> start!93862 (and (array_inv!25070 _values!955) e!604547)))

(assert (=> start!93862 tp!75427))

(declare-datatypes ((array!67295 0))(
  ( (array!67296 (arr!32355 (Array (_ BitVec 32) (_ BitVec 64))) (size!32891 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67295)

(declare-fun array_inv!25071 (array!67295) Bool)

(assert (=> start!93862 (array_inv!25071 _keys!1163)))

(declare-fun b!1061580 () Bool)

(declare-fun res!708903 () Bool)

(assert (=> b!1061580 (=> (not res!708903) (not e!604544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67295 (_ BitVec 32)) Bool)

(assert (=> b!1061580 (= res!708903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061581 () Bool)

(declare-fun e!604548 () Bool)

(assert (=> b!1061581 (= e!604548 tp_is_empty!25145)))

(declare-fun b!1061582 () Bool)

(assert (=> b!1061582 (= e!604544 (not true))))

(declare-datatypes ((tuple2!15956 0))(
  ( (tuple2!15957 (_1!7989 (_ BitVec 64)) (_2!7989 V!38661)) )
))
(declare-datatypes ((List!22542 0))(
  ( (Nil!22539) (Cons!22538 (h!23747 tuple2!15956) (t!31851 List!22542)) )
))
(declare-datatypes ((ListLongMap!13925 0))(
  ( (ListLongMap!13926 (toList!6978 List!22542)) )
))
(declare-fun lt!467658 () ListLongMap!13925)

(declare-fun lt!467659 () ListLongMap!13925)

(assert (=> b!1061582 (= lt!467658 lt!467659)))

(declare-fun zeroValueBefore!47 () V!38661)

(declare-datatypes ((Unit!34758 0))(
  ( (Unit!34759) )
))
(declare-fun lt!467657 () Unit!34758)

(declare-fun minValue!907 () V!38661)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38661)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!617 (array!67295 array!67293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38661 V!38661 V!38661 V!38661 (_ BitVec 32) Int) Unit!34758)

(assert (=> b!1061582 (= lt!467657 (lemmaNoChangeToArrayThenSameMapNoExtras!617 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3580 (array!67295 array!67293 (_ BitVec 32) (_ BitVec 32) V!38661 V!38661 (_ BitVec 32) Int) ListLongMap!13925)

(assert (=> b!1061582 (= lt!467659 (getCurrentListMapNoExtraKeys!3580 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061582 (= lt!467658 (getCurrentListMapNoExtraKeys!3580 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061583 () Bool)

(declare-fun res!708902 () Bool)

(assert (=> b!1061583 (=> (not res!708902) (not e!604544))))

(assert (=> b!1061583 (= res!708902 (and (= (size!32890 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32891 _keys!1163) (size!32890 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061584 () Bool)

(declare-fun res!708901 () Bool)

(assert (=> b!1061584 (=> (not res!708901) (not e!604544))))

(declare-datatypes ((List!22543 0))(
  ( (Nil!22540) (Cons!22539 (h!23748 (_ BitVec 64)) (t!31852 List!22543)) )
))
(declare-fun arrayNoDuplicates!0 (array!67295 (_ BitVec 32) List!22543) Bool)

(assert (=> b!1061584 (= res!708901 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22540))))

(declare-fun mapIsEmpty!39388 () Bool)

(declare-fun mapRes!39388 () Bool)

(assert (=> mapIsEmpty!39388 mapRes!39388))

(declare-fun mapNonEmpty!39388 () Bool)

(declare-fun tp!75428 () Bool)

(assert (=> mapNonEmpty!39388 (= mapRes!39388 (and tp!75428 e!604548))))

(declare-fun mapValue!39388 () ValueCell!11869)

(declare-fun mapKey!39388 () (_ BitVec 32))

(declare-fun mapRest!39388 () (Array (_ BitVec 32) ValueCell!11869))

(assert (=> mapNonEmpty!39388 (= (arr!32354 _values!955) (store mapRest!39388 mapKey!39388 mapValue!39388))))

(declare-fun b!1061585 () Bool)

(assert (=> b!1061585 (= e!604547 (and e!604546 mapRes!39388))))

(declare-fun condMapEmpty!39388 () Bool)

(declare-fun mapDefault!39388 () ValueCell!11869)

