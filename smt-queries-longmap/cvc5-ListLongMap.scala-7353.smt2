; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93822 () Bool)

(assert start!93822)

(declare-fun b_free!21295 () Bool)

(declare-fun b_next!21295 () Bool)

(assert (=> start!93822 (= b_free!21295 (not b_next!21295))))

(declare-fun tp!75308 () Bool)

(declare-fun b_and!34009 () Bool)

(assert (=> start!93822 (= tp!75308 b_and!34009)))

(declare-fun b!1061159 () Bool)

(declare-fun e!604245 () Bool)

(assert (=> b!1061159 (= e!604245 false)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38609 0))(
  ( (V!38610 (val!12603 Int)) )
))
(declare-fun minValue!907 () V!38609)

(declare-datatypes ((array!67213 0))(
  ( (array!67214 (arr!32314 (Array (_ BitVec 32) (_ BitVec 64))) (size!32850 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67213)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((ValueCell!11849 0))(
  ( (ValueCellFull!11849 (v!15213 V!38609)) (EmptyCell!11849) )
))
(declare-datatypes ((array!67215 0))(
  ( (array!67216 (arr!32315 (Array (_ BitVec 32) ValueCell!11849)) (size!32851 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67215)

(declare-datatypes ((tuple2!15924 0))(
  ( (tuple2!15925 (_1!7973 (_ BitVec 64)) (_2!7973 V!38609)) )
))
(declare-datatypes ((List!22511 0))(
  ( (Nil!22508) (Cons!22507 (h!23716 tuple2!15924) (t!31820 List!22511)) )
))
(declare-datatypes ((ListLongMap!13893 0))(
  ( (ListLongMap!13894 (toList!6962 List!22511)) )
))
(declare-fun lt!467485 () ListLongMap!13893)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38609)

(declare-fun getCurrentListMapNoExtraKeys!3564 (array!67213 array!67215 (_ BitVec 32) (_ BitVec 32) V!38609 V!38609 (_ BitVec 32) Int) ListLongMap!13893)

(assert (=> b!1061159 (= lt!467485 (getCurrentListMapNoExtraKeys!3564 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38609)

(declare-fun lt!467484 () ListLongMap!13893)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061159 (= lt!467484 (getCurrentListMapNoExtraKeys!3564 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061160 () Bool)

(declare-fun e!604248 () Bool)

(declare-fun tp_is_empty!25105 () Bool)

(assert (=> b!1061160 (= e!604248 tp_is_empty!25105)))

(declare-fun res!708663 () Bool)

(assert (=> start!93822 (=> (not res!708663) (not e!604245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93822 (= res!708663 (validMask!0 mask!1515))))

(assert (=> start!93822 e!604245))

(assert (=> start!93822 true))

(assert (=> start!93822 tp_is_empty!25105))

(declare-fun e!604244 () Bool)

(declare-fun array_inv!25042 (array!67215) Bool)

(assert (=> start!93822 (and (array_inv!25042 _values!955) e!604244)))

(assert (=> start!93822 tp!75308))

(declare-fun array_inv!25043 (array!67213) Bool)

(assert (=> start!93822 (array_inv!25043 _keys!1163)))

(declare-fun b!1061161 () Bool)

(declare-fun res!708664 () Bool)

(assert (=> b!1061161 (=> (not res!708664) (not e!604245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67213 (_ BitVec 32)) Bool)

(assert (=> b!1061161 (= res!708664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39328 () Bool)

(declare-fun mapRes!39328 () Bool)

(assert (=> mapIsEmpty!39328 mapRes!39328))

(declare-fun b!1061162 () Bool)

(declare-fun e!604247 () Bool)

(assert (=> b!1061162 (= e!604247 tp_is_empty!25105)))

(declare-fun b!1061163 () Bool)

(assert (=> b!1061163 (= e!604244 (and e!604248 mapRes!39328))))

(declare-fun condMapEmpty!39328 () Bool)

(declare-fun mapDefault!39328 () ValueCell!11849)

