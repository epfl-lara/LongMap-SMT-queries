; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93912 () Bool)

(assert start!93912)

(declare-fun b_free!21371 () Bool)

(declare-fun b_next!21371 () Bool)

(assert (=> start!93912 (= b_free!21371 (not b_next!21371))))

(declare-fun tp!75538 () Bool)

(declare-fun b_and!34093 () Bool)

(assert (=> start!93912 (= tp!75538 b_and!34093)))

(declare-fun b!1062085 () Bool)

(declare-fun e!604918 () Bool)

(assert (=> b!1062085 (= e!604918 true)))

(declare-datatypes ((V!38709 0))(
  ( (V!38710 (val!12641 Int)) )
))
(declare-datatypes ((tuple2!15986 0))(
  ( (tuple2!15987 (_1!8004 (_ BitVec 64)) (_2!8004 V!38709)) )
))
(declare-datatypes ((List!22569 0))(
  ( (Nil!22566) (Cons!22565 (h!23774 tuple2!15986) (t!31880 List!22569)) )
))
(declare-datatypes ((ListLongMap!13955 0))(
  ( (ListLongMap!13956 (toList!6993 List!22569)) )
))
(declare-fun lt!467904 () ListLongMap!13955)

(declare-fun -!559 (ListLongMap!13955 (_ BitVec 64)) ListLongMap!13955)

(assert (=> b!1062085 (= (-!559 lt!467904 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467904)))

(declare-datatypes ((Unit!34788 0))(
  ( (Unit!34789) )
))
(declare-fun lt!467905 () Unit!34788)

(declare-fun removeNotPresentStillSame!6 (ListLongMap!13955 (_ BitVec 64)) Unit!34788)

(assert (=> b!1062085 (= lt!467905 (removeNotPresentStillSame!6 lt!467904 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062086 () Bool)

(declare-fun e!604913 () Bool)

(declare-fun tp_is_empty!25181 () Bool)

(assert (=> b!1062086 (= e!604913 tp_is_empty!25181)))

(declare-fun mapNonEmpty!39445 () Bool)

(declare-fun mapRes!39445 () Bool)

(declare-fun tp!75539 () Bool)

(declare-fun e!604915 () Bool)

(assert (=> mapNonEmpty!39445 (= mapRes!39445 (and tp!75539 e!604915))))

(declare-datatypes ((ValueCell!11887 0))(
  ( (ValueCellFull!11887 (v!15251 V!38709)) (EmptyCell!11887) )
))
(declare-fun mapValue!39445 () ValueCell!11887)

(declare-datatypes ((array!67367 0))(
  ( (array!67368 (arr!32390 (Array (_ BitVec 32) ValueCell!11887)) (size!32926 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67367)

(declare-fun mapKey!39445 () (_ BitVec 32))

(declare-fun mapRest!39445 () (Array (_ BitVec 32) ValueCell!11887))

(assert (=> mapNonEmpty!39445 (= (arr!32390 _values!955) (store mapRest!39445 mapKey!39445 mapValue!39445))))

(declare-fun b!1062087 () Bool)

(declare-fun res!709194 () Bool)

(declare-fun e!604917 () Bool)

(assert (=> b!1062087 (=> (not res!709194) (not e!604917))))

(declare-datatypes ((array!67369 0))(
  ( (array!67370 (arr!32391 (Array (_ BitVec 32) (_ BitVec 64))) (size!32927 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67369)

(declare-datatypes ((List!22570 0))(
  ( (Nil!22567) (Cons!22566 (h!23775 (_ BitVec 64)) (t!31881 List!22570)) )
))
(declare-fun arrayNoDuplicates!0 (array!67369 (_ BitVec 32) List!22570) Bool)

(assert (=> b!1062087 (= res!709194 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22567))))

(declare-fun b!1062088 () Bool)

(assert (=> b!1062088 (= e!604915 tp_is_empty!25181)))

(declare-fun b!1062089 () Bool)

(declare-fun res!709192 () Bool)

(assert (=> b!1062089 (=> (not res!709192) (not e!604917))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062089 (= res!709192 (and (= (size!32926 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32927 _keys!1163) (size!32926 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062090 () Bool)

(declare-fun e!604916 () Bool)

(assert (=> b!1062090 (= e!604916 (and e!604913 mapRes!39445))))

(declare-fun condMapEmpty!39445 () Bool)

(declare-fun mapDefault!39445 () ValueCell!11887)

