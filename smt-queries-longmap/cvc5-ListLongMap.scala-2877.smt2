; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41382 () Bool)

(assert start!41382)

(declare-fun b!462509 () Bool)

(declare-fun res!276600 () Bool)

(declare-fun e!269907 () Bool)

(assert (=> b!462509 (=> (not res!276600) (not e!269907))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28797 0))(
  ( (array!28798 (arr!13832 (Array (_ BitVec 32) (_ BitVec 64))) (size!14184 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28797)

(declare-datatypes ((V!17771 0))(
  ( (V!17772 (val!6294 Int)) )
))
(declare-datatypes ((ValueCell!5906 0))(
  ( (ValueCellFull!5906 (v!8581 V!17771)) (EmptyCell!5906) )
))
(declare-datatypes ((array!28799 0))(
  ( (array!28800 (arr!13833 (Array (_ BitVec 32) ValueCell!5906)) (size!14185 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28799)

(assert (=> b!462509 (= res!276600 (and (= (size!14185 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14184 _keys!1025) (size!14185 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462510 () Bool)

(declare-fun e!269903 () Bool)

(declare-fun tp_is_empty!12499 () Bool)

(assert (=> b!462510 (= e!269903 tp_is_empty!12499)))

(declare-fun mapNonEmpty!20419 () Bool)

(declare-fun mapRes!20419 () Bool)

(declare-fun tp!39238 () Bool)

(declare-fun e!269904 () Bool)

(assert (=> mapNonEmpty!20419 (= mapRes!20419 (and tp!39238 e!269904))))

(declare-fun mapValue!20419 () ValueCell!5906)

(declare-fun mapRest!20419 () (Array (_ BitVec 32) ValueCell!5906))

(declare-fun mapKey!20419 () (_ BitVec 32))

(assert (=> mapNonEmpty!20419 (= (arr!13833 _values!833) (store mapRest!20419 mapKey!20419 mapValue!20419))))

(declare-fun b!462511 () Bool)

(declare-fun e!269905 () Bool)

(assert (=> b!462511 (= e!269905 (and e!269903 mapRes!20419))))

(declare-fun condMapEmpty!20419 () Bool)

(declare-fun mapDefault!20419 () ValueCell!5906)

