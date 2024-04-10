; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82136 () Bool)

(assert start!82136)

(declare-fun mapNonEmpty!33652 () Bool)

(declare-fun mapRes!33652 () Bool)

(declare-fun tp!64257 () Bool)

(declare-fun e!539640 () Bool)

(assert (=> mapNonEmpty!33652 (= mapRes!33652 (and tp!64257 e!539640))))

(declare-fun mapKey!33652 () (_ BitVec 32))

(declare-datatypes ((V!33137 0))(
  ( (V!33138 (val!10608 Int)) )
))
(declare-datatypes ((ValueCell!10076 0))(
  ( (ValueCellFull!10076 (v!13165 V!33137)) (EmptyCell!10076) )
))
(declare-fun mapRest!33652 () (Array (_ BitVec 32) ValueCell!10076))

(declare-fun mapValue!33652 () ValueCell!10076)

(declare-datatypes ((array!58335 0))(
  ( (array!58336 (arr!28041 (Array (_ BitVec 32) ValueCell!10076)) (size!28520 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58335)

(assert (=> mapNonEmpty!33652 (= (arr!28041 _values!1386) (store mapRest!33652 mapKey!33652 mapValue!33652))))

(declare-fun b!957383 () Bool)

(declare-fun tp_is_empty!21115 () Bool)

(assert (=> b!957383 (= e!539640 tp_is_empty!21115)))

(declare-fun b!957384 () Bool)

(declare-fun e!539638 () Bool)

(assert (=> b!957384 (= e!539638 false)))

(declare-fun lt!430314 () Bool)

(declare-datatypes ((array!58337 0))(
  ( (array!58338 (arr!28042 (Array (_ BitVec 32) (_ BitVec 64))) (size!28521 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58337)

(declare-datatypes ((List!19507 0))(
  ( (Nil!19504) (Cons!19503 (h!20665 (_ BitVec 64)) (t!27870 List!19507)) )
))
(declare-fun arrayNoDuplicates!0 (array!58337 (_ BitVec 32) List!19507) Bool)

(assert (=> b!957384 (= lt!430314 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19504))))

(declare-fun b!957385 () Bool)

(declare-fun e!539639 () Bool)

(assert (=> b!957385 (= e!539639 tp_is_empty!21115)))

(declare-fun b!957386 () Bool)

(declare-fun res!640904 () Bool)

(assert (=> b!957386 (=> (not res!640904) (not e!539638))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957386 (= res!640904 (and (= (size!28520 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28521 _keys!1668) (size!28520 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957387 () Bool)

(declare-fun e!539636 () Bool)

(assert (=> b!957387 (= e!539636 (and e!539639 mapRes!33652))))

(declare-fun condMapEmpty!33652 () Bool)

(declare-fun mapDefault!33652 () ValueCell!10076)

