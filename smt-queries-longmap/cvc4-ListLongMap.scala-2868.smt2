; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41294 () Bool)

(assert start!41294)

(declare-fun mapNonEmpty!20332 () Bool)

(declare-fun mapRes!20332 () Bool)

(declare-fun tp!39151 () Bool)

(declare-fun e!269443 () Bool)

(assert (=> mapNonEmpty!20332 (= mapRes!20332 (and tp!39151 e!269443))))

(declare-datatypes ((V!17703 0))(
  ( (V!17704 (val!6269 Int)) )
))
(declare-datatypes ((ValueCell!5881 0))(
  ( (ValueCellFull!5881 (v!8555 V!17703)) (EmptyCell!5881) )
))
(declare-datatypes ((array!28695 0))(
  ( (array!28696 (arr!13785 (Array (_ BitVec 32) ValueCell!5881)) (size!14137 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28695)

(declare-fun mapKey!20332 () (_ BitVec 32))

(declare-fun mapRest!20332 () (Array (_ BitVec 32) ValueCell!5881))

(declare-fun mapValue!20332 () ValueCell!5881)

(assert (=> mapNonEmpty!20332 (= (arr!13785 _values!833) (store mapRest!20332 mapKey!20332 mapValue!20332))))

(declare-fun b!461923 () Bool)

(declare-fun tp_is_empty!12449 () Bool)

(assert (=> b!461923 (= e!269443 tp_is_empty!12449)))

(declare-fun res!276295 () Bool)

(declare-fun e!269440 () Bool)

(assert (=> start!41294 (=> (not res!276295) (not e!269440))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41294 (= res!276295 (validMask!0 mask!1365))))

(assert (=> start!41294 e!269440))

(assert (=> start!41294 true))

(declare-datatypes ((array!28697 0))(
  ( (array!28698 (arr!13786 (Array (_ BitVec 32) (_ BitVec 64))) (size!14138 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28697)

(declare-fun array_inv!9970 (array!28697) Bool)

(assert (=> start!41294 (array_inv!9970 _keys!1025)))

(declare-fun e!269439 () Bool)

(declare-fun array_inv!9971 (array!28695) Bool)

(assert (=> start!41294 (and (array_inv!9971 _values!833) e!269439)))

(declare-fun b!461924 () Bool)

(declare-fun e!269442 () Bool)

(assert (=> b!461924 (= e!269442 tp_is_empty!12449)))

(declare-fun b!461925 () Bool)

(assert (=> b!461925 (= e!269439 (and e!269442 mapRes!20332))))

(declare-fun condMapEmpty!20332 () Bool)

(declare-fun mapDefault!20332 () ValueCell!5881)

