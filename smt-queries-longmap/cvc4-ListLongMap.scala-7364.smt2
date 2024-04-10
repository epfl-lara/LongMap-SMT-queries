; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93906 () Bool)

(assert start!93906)

(declare-fun b_free!21365 () Bool)

(declare-fun b_next!21365 () Bool)

(assert (=> start!93906 (= b_free!21365 (not b_next!21365))))

(declare-fun tp!75521 () Bool)

(declare-fun b_and!34087 () Bool)

(assert (=> start!93906 (= tp!75521 b_and!34087)))

(declare-fun mapNonEmpty!39436 () Bool)

(declare-fun mapRes!39436 () Bool)

(declare-fun tp!75520 () Bool)

(declare-fun e!604854 () Bool)

(assert (=> mapNonEmpty!39436 (= mapRes!39436 (and tp!75520 e!604854))))

(declare-datatypes ((V!38701 0))(
  ( (V!38702 (val!12638 Int)) )
))
(declare-datatypes ((ValueCell!11884 0))(
  ( (ValueCellFull!11884 (v!15248 V!38701)) (EmptyCell!11884) )
))
(declare-datatypes ((array!67355 0))(
  ( (array!67356 (arr!32384 (Array (_ BitVec 32) ValueCell!11884)) (size!32920 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67355)

(declare-fun mapKey!39436 () (_ BitVec 32))

(declare-fun mapRest!39436 () (Array (_ BitVec 32) ValueCell!11884))

(declare-fun mapValue!39436 () ValueCell!11884)

(assert (=> mapNonEmpty!39436 (= (arr!32384 _values!955) (store mapRest!39436 mapKey!39436 mapValue!39436))))

(declare-fun b!1062004 () Bool)

(declare-fun res!709137 () Bool)

(declare-fun e!604850 () Bool)

(assert (=> b!1062004 (=> (not res!709137) (not e!604850))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67357 0))(
  ( (array!67358 (arr!32385 (Array (_ BitVec 32) (_ BitVec 64))) (size!32921 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67357)

(assert (=> b!1062004 (= res!709137 (and (= (size!32920 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32921 _keys!1163) (size!32920 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062005 () Bool)

(declare-fun e!604851 () Bool)

(assert (=> b!1062005 (= e!604851 true)))

(declare-datatypes ((tuple2!15980 0))(
  ( (tuple2!15981 (_1!8001 (_ BitVec 64)) (_2!8001 V!38701)) )
))
(declare-datatypes ((List!22563 0))(
  ( (Nil!22560) (Cons!22559 (h!23768 tuple2!15980) (t!31874 List!22563)) )
))
(declare-datatypes ((ListLongMap!13949 0))(
  ( (ListLongMap!13950 (toList!6990 List!22563)) )
))
(declare-fun lt!467861 () ListLongMap!13949)

(declare-fun -!556 (ListLongMap!13949 (_ BitVec 64)) ListLongMap!13949)

(assert (=> b!1062005 (= (-!556 lt!467861 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467861)))

(declare-datatypes ((Unit!34782 0))(
  ( (Unit!34783) )
))
(declare-fun lt!467857 () Unit!34782)

(declare-fun removeNotPresentStillSame!3 (ListLongMap!13949 (_ BitVec 64)) Unit!34782)

(assert (=> b!1062005 (= lt!467857 (removeNotPresentStillSame!3 lt!467861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!709140 () Bool)

(assert (=> start!93906 (=> (not res!709140) (not e!604850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93906 (= res!709140 (validMask!0 mask!1515))))

(assert (=> start!93906 e!604850))

(assert (=> start!93906 true))

(declare-fun tp_is_empty!25175 () Bool)

(assert (=> start!93906 tp_is_empty!25175))

(declare-fun e!604853 () Bool)

(declare-fun array_inv!25092 (array!67355) Bool)

(assert (=> start!93906 (and (array_inv!25092 _values!955) e!604853)))

(assert (=> start!93906 tp!75521))

(declare-fun array_inv!25093 (array!67357) Bool)

(assert (=> start!93906 (array_inv!25093 _keys!1163)))

(declare-fun mapIsEmpty!39436 () Bool)

(assert (=> mapIsEmpty!39436 mapRes!39436))

(declare-fun b!1062006 () Bool)

(declare-fun res!709142 () Bool)

(assert (=> b!1062006 (=> (not res!709142) (not e!604850))))

(declare-datatypes ((List!22564 0))(
  ( (Nil!22561) (Cons!22560 (h!23769 (_ BitVec 64)) (t!31875 List!22564)) )
))
(declare-fun arrayNoDuplicates!0 (array!67357 (_ BitVec 32) List!22564) Bool)

(assert (=> b!1062006 (= res!709142 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22561))))

(declare-fun b!1062007 () Bool)

(declare-fun e!604855 () Bool)

(assert (=> b!1062007 (= e!604855 e!604851)))

(declare-fun res!709138 () Bool)

(assert (=> b!1062007 (=> res!709138 e!604851)))

(declare-fun contains!6224 (ListLongMap!13949 (_ BitVec 64)) Bool)

(assert (=> b!1062007 (= res!709138 (contains!6224 lt!467861 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun zeroValueBefore!47 () V!38701)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38701)

(declare-fun getCurrentListMap!3977 (array!67357 array!67355 (_ BitVec 32) (_ BitVec 32) V!38701 V!38701 (_ BitVec 32) Int) ListLongMap!13949)

(assert (=> b!1062007 (= lt!467861 (getCurrentListMap!3977 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062008 () Bool)

(declare-fun res!709139 () Bool)

(assert (=> b!1062008 (=> (not res!709139) (not e!604850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67357 (_ BitVec 32)) Bool)

(assert (=> b!1062008 (= res!709139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062009 () Bool)

(assert (=> b!1062009 (= e!604850 (not e!604855))))

(declare-fun res!709141 () Bool)

(assert (=> b!1062009 (=> res!709141 e!604855)))

(assert (=> b!1062009 (= res!709141 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!467858 () ListLongMap!13949)

(declare-fun lt!467859 () ListLongMap!13949)

(assert (=> b!1062009 (= lt!467858 lt!467859)))

(declare-fun lt!467860 () Unit!34782)

(declare-fun zeroValueAfter!47 () V!38701)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!628 (array!67357 array!67355 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38701 V!38701 V!38701 V!38701 (_ BitVec 32) Int) Unit!34782)

(assert (=> b!1062009 (= lt!467860 (lemmaNoChangeToArrayThenSameMapNoExtras!628 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3591 (array!67357 array!67355 (_ BitVec 32) (_ BitVec 32) V!38701 V!38701 (_ BitVec 32) Int) ListLongMap!13949)

(assert (=> b!1062009 (= lt!467859 (getCurrentListMapNoExtraKeys!3591 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062009 (= lt!467858 (getCurrentListMapNoExtraKeys!3591 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062010 () Bool)

(assert (=> b!1062010 (= e!604854 tp_is_empty!25175)))

(declare-fun b!1062011 () Bool)

(declare-fun e!604852 () Bool)

(assert (=> b!1062011 (= e!604853 (and e!604852 mapRes!39436))))

(declare-fun condMapEmpty!39436 () Bool)

(declare-fun mapDefault!39436 () ValueCell!11884)

