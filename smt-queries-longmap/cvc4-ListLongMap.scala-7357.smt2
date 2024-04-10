; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93850 () Bool)

(assert start!93850)

(declare-fun b_free!21323 () Bool)

(declare-fun b_next!21323 () Bool)

(assert (=> start!93850 (= b_free!21323 (not b_next!21323))))

(declare-fun tp!75391 () Bool)

(declare-fun b_and!34037 () Bool)

(assert (=> start!93850 (= tp!75391 b_and!34037)))

(declare-fun b!1061453 () Bool)

(declare-fun res!708831 () Bool)

(declare-fun e!604458 () Bool)

(assert (=> b!1061453 (=> (not res!708831) (not e!604458))))

(declare-datatypes ((array!67269 0))(
  ( (array!67270 (arr!32342 (Array (_ BitVec 32) (_ BitVec 64))) (size!32878 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67269)

(declare-datatypes ((List!22535 0))(
  ( (Nil!22532) (Cons!22531 (h!23740 (_ BitVec 64)) (t!31844 List!22535)) )
))
(declare-fun arrayNoDuplicates!0 (array!67269 (_ BitVec 32) List!22535) Bool)

(assert (=> b!1061453 (= res!708831 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22532))))

(declare-fun b!1061454 () Bool)

(declare-fun res!708830 () Bool)

(assert (=> b!1061454 (=> (not res!708830) (not e!604458))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38645 0))(
  ( (V!38646 (val!12617 Int)) )
))
(declare-datatypes ((ValueCell!11863 0))(
  ( (ValueCellFull!11863 (v!15227 V!38645)) (EmptyCell!11863) )
))
(declare-datatypes ((array!67271 0))(
  ( (array!67272 (arr!32343 (Array (_ BitVec 32) ValueCell!11863)) (size!32879 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67271)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061454 (= res!708830 (and (= (size!32879 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32878 _keys!1163) (size!32879 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061455 () Bool)

(assert (=> b!1061455 (= e!604458 (not true))))

(declare-datatypes ((tuple2!15950 0))(
  ( (tuple2!15951 (_1!7986 (_ BitVec 64)) (_2!7986 V!38645)) )
))
(declare-datatypes ((List!22536 0))(
  ( (Nil!22533) (Cons!22532 (h!23741 tuple2!15950) (t!31845 List!22536)) )
))
(declare-datatypes ((ListLongMap!13919 0))(
  ( (ListLongMap!13920 (toList!6975 List!22536)) )
))
(declare-fun lt!467603 () ListLongMap!13919)

(declare-fun lt!467604 () ListLongMap!13919)

(assert (=> b!1061455 (= lt!467603 lt!467604)))

(declare-fun zeroValueBefore!47 () V!38645)

(declare-fun minValue!907 () V!38645)

(declare-datatypes ((Unit!34752 0))(
  ( (Unit!34753) )
))
(declare-fun lt!467605 () Unit!34752)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38645)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!614 (array!67269 array!67271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38645 V!38645 V!38645 V!38645 (_ BitVec 32) Int) Unit!34752)

(assert (=> b!1061455 (= lt!467605 (lemmaNoChangeToArrayThenSameMapNoExtras!614 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3577 (array!67269 array!67271 (_ BitVec 32) (_ BitVec 32) V!38645 V!38645 (_ BitVec 32) Int) ListLongMap!13919)

(assert (=> b!1061455 (= lt!467604 (getCurrentListMapNoExtraKeys!3577 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061455 (= lt!467603 (getCurrentListMapNoExtraKeys!3577 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061456 () Bool)

(declare-fun e!604455 () Bool)

(declare-fun tp_is_empty!25133 () Bool)

(assert (=> b!1061456 (= e!604455 tp_is_empty!25133)))

(declare-fun b!1061457 () Bool)

(declare-fun e!604454 () Bool)

(declare-fun e!604456 () Bool)

(declare-fun mapRes!39370 () Bool)

(assert (=> b!1061457 (= e!604454 (and e!604456 mapRes!39370))))

(declare-fun condMapEmpty!39370 () Bool)

(declare-fun mapDefault!39370 () ValueCell!11863)

