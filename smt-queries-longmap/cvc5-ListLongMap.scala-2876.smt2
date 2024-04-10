; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41376 () Bool)

(assert start!41376)

(declare-fun b!462455 () Bool)

(declare-fun e!269860 () Bool)

(declare-fun tp_is_empty!12493 () Bool)

(assert (=> b!462455 (= e!269860 tp_is_empty!12493)))

(declare-fun res!276573 () Bool)

(declare-fun e!269859 () Bool)

(assert (=> start!41376 (=> (not res!276573) (not e!269859))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41376 (= res!276573 (validMask!0 mask!1365))))

(assert (=> start!41376 e!269859))

(assert (=> start!41376 true))

(declare-datatypes ((array!28785 0))(
  ( (array!28786 (arr!13826 (Array (_ BitVec 32) (_ BitVec 64))) (size!14178 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28785)

(declare-fun array_inv!9998 (array!28785) Bool)

(assert (=> start!41376 (array_inv!9998 _keys!1025)))

(declare-datatypes ((V!17763 0))(
  ( (V!17764 (val!6291 Int)) )
))
(declare-datatypes ((ValueCell!5903 0))(
  ( (ValueCellFull!5903 (v!8578 V!17763)) (EmptyCell!5903) )
))
(declare-datatypes ((array!28787 0))(
  ( (array!28788 (arr!13827 (Array (_ BitVec 32) ValueCell!5903)) (size!14179 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28787)

(declare-fun e!269858 () Bool)

(declare-fun array_inv!9999 (array!28787) Bool)

(assert (=> start!41376 (and (array_inv!9999 _values!833) e!269858)))

(declare-fun mapNonEmpty!20410 () Bool)

(declare-fun mapRes!20410 () Bool)

(declare-fun tp!39229 () Bool)

(declare-fun e!269861 () Bool)

(assert (=> mapNonEmpty!20410 (= mapRes!20410 (and tp!39229 e!269861))))

(declare-fun mapRest!20410 () (Array (_ BitVec 32) ValueCell!5903))

(declare-fun mapValue!20410 () ValueCell!5903)

(declare-fun mapKey!20410 () (_ BitVec 32))

(assert (=> mapNonEmpty!20410 (= (arr!13827 _values!833) (store mapRest!20410 mapKey!20410 mapValue!20410))))

(declare-fun b!462456 () Bool)

(assert (=> b!462456 (= e!269858 (and e!269860 mapRes!20410))))

(declare-fun condMapEmpty!20410 () Bool)

(declare-fun mapDefault!20410 () ValueCell!5903)

