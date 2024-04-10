; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82160 () Bool)

(assert start!82160)

(declare-fun res!641012 () Bool)

(declare-fun e!539817 () Bool)

(assert (=> start!82160 (=> (not res!641012) (not e!539817))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82160 (= res!641012 (validMask!0 mask!2088))))

(assert (=> start!82160 e!539817))

(assert (=> start!82160 true))

(declare-datatypes ((V!33169 0))(
  ( (V!33170 (val!10620 Int)) )
))
(declare-datatypes ((ValueCell!10088 0))(
  ( (ValueCellFull!10088 (v!13177 V!33169)) (EmptyCell!10088) )
))
(declare-datatypes ((array!58381 0))(
  ( (array!58382 (arr!28064 (Array (_ BitVec 32) ValueCell!10088)) (size!28543 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58381)

(declare-fun e!539819 () Bool)

(declare-fun array_inv!21767 (array!58381) Bool)

(assert (=> start!82160 (and (array_inv!21767 _values!1386) e!539819)))

(declare-datatypes ((array!58383 0))(
  ( (array!58384 (arr!28065 (Array (_ BitVec 32) (_ BitVec 64))) (size!28544 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58383)

(declare-fun array_inv!21768 (array!58383) Bool)

(assert (=> start!82160 (array_inv!21768 _keys!1668)))

(declare-fun mapNonEmpty!33688 () Bool)

(declare-fun mapRes!33688 () Bool)

(declare-fun tp!64293 () Bool)

(declare-fun e!539820 () Bool)

(assert (=> mapNonEmpty!33688 (= mapRes!33688 (and tp!64293 e!539820))))

(declare-fun mapKey!33688 () (_ BitVec 32))

(declare-fun mapRest!33688 () (Array (_ BitVec 32) ValueCell!10088))

(declare-fun mapValue!33688 () ValueCell!10088)

(assert (=> mapNonEmpty!33688 (= (arr!28064 _values!1386) (store mapRest!33688 mapKey!33688 mapValue!33688))))

(declare-fun b!957599 () Bool)

(assert (=> b!957599 (= e!539817 false)))

(declare-fun lt!430350 () Bool)

(declare-datatypes ((List!19516 0))(
  ( (Nil!19513) (Cons!19512 (h!20674 (_ BitVec 64)) (t!27879 List!19516)) )
))
(declare-fun arrayNoDuplicates!0 (array!58383 (_ BitVec 32) List!19516) Bool)

(assert (=> b!957599 (= lt!430350 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19513))))

(declare-fun b!957600 () Bool)

(declare-fun e!539816 () Bool)

(declare-fun tp_is_empty!21139 () Bool)

(assert (=> b!957600 (= e!539816 tp_is_empty!21139)))

(declare-fun b!957601 () Bool)

(assert (=> b!957601 (= e!539819 (and e!539816 mapRes!33688))))

(declare-fun condMapEmpty!33688 () Bool)

(declare-fun mapDefault!33688 () ValueCell!10088)

