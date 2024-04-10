; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36064 () Bool)

(assert start!36064)

(declare-fun b!362102 () Bool)

(declare-fun res!201461 () Bool)

(declare-fun e!221780 () Bool)

(assert (=> b!362102 (=> (not res!201461) (not e!221780))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-datatypes ((array!20403 0))(
  ( (array!20404 (arr!9686 (Array (_ BitVec 32) (_ BitVec 64))) (size!10038 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20403)

(declare-fun k!1134 () (_ BitVec 64))

(assert (=> b!362102 (= res!201461 (not (= (select (arr!9686 _keys!1541) from!1924) k!1134)))))

(declare-fun b!362103 () Bool)

(declare-fun e!221784 () Bool)

(declare-fun tp_is_empty!8423 () Bool)

(assert (=> b!362103 (= e!221784 tp_is_empty!8423)))

(declare-fun b!362104 () Bool)

(declare-fun res!201463 () Bool)

(assert (=> b!362104 (=> (not res!201463) (not e!221780))))

(declare-fun arrayContainsKey!0 (array!20403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!362104 (= res!201463 (arrayContainsKey!0 _keys!1541 k!1134 from!1924))))

(declare-fun mapNonEmpty!14169 () Bool)

(declare-fun mapRes!14169 () Bool)

(declare-fun tp!28245 () Bool)

(assert (=> mapNonEmpty!14169 (= mapRes!14169 (and tp!28245 e!221784))))

(declare-datatypes ((V!12207 0))(
  ( (V!12208 (val!4256 Int)) )
))
(declare-datatypes ((ValueCell!3868 0))(
  ( (ValueCellFull!3868 (v!6451 V!12207)) (EmptyCell!3868) )
))
(declare-datatypes ((array!20405 0))(
  ( (array!20406 (arr!9687 (Array (_ BitVec 32) ValueCell!3868)) (size!10039 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20405)

(declare-fun mapRest!14169 () (Array (_ BitVec 32) ValueCell!3868))

(declare-fun mapKey!14169 () (_ BitVec 32))

(declare-fun mapValue!14169 () ValueCell!3868)

(assert (=> mapNonEmpty!14169 (= (arr!9687 _values!1277) (store mapRest!14169 mapKey!14169 mapValue!14169))))

(declare-fun res!201459 () Bool)

(assert (=> start!36064 (=> (not res!201459) (not e!221780))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36064 (= res!201459 (validMask!0 mask!1943))))

(assert (=> start!36064 e!221780))

(assert (=> start!36064 true))

(declare-fun array_inv!7128 (array!20403) Bool)

(assert (=> start!36064 (array_inv!7128 _keys!1541)))

(declare-fun e!221783 () Bool)

(declare-fun array_inv!7129 (array!20405) Bool)

(assert (=> start!36064 (and (array_inv!7129 _values!1277) e!221783)))

(declare-fun b!362105 () Bool)

(declare-fun res!201458 () Bool)

(assert (=> b!362105 (=> (not res!201458) (not e!221780))))

(declare-datatypes ((List!5523 0))(
  ( (Nil!5520) (Cons!5519 (h!6375 (_ BitVec 64)) (t!10673 List!5523)) )
))
(declare-fun arrayNoDuplicates!0 (array!20403 (_ BitVec 32) List!5523) Bool)

(assert (=> b!362105 (= res!201458 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5520))))

(declare-fun b!362106 () Bool)

(declare-fun e!221781 () Bool)

(assert (=> b!362106 (= e!221783 (and e!221781 mapRes!14169))))

(declare-fun condMapEmpty!14169 () Bool)

(declare-fun mapDefault!14169 () ValueCell!3868)

