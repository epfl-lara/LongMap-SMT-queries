; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82172 () Bool)

(assert start!82172)

(declare-fun b!957707 () Bool)

(declare-fun e!539908 () Bool)

(declare-fun tp_is_empty!21151 () Bool)

(assert (=> b!957707 (= e!539908 tp_is_empty!21151)))

(declare-fun mapNonEmpty!33706 () Bool)

(declare-fun mapRes!33706 () Bool)

(declare-fun tp!64311 () Bool)

(declare-fun e!539909 () Bool)

(assert (=> mapNonEmpty!33706 (= mapRes!33706 (and tp!64311 e!539909))))

(declare-datatypes ((V!33185 0))(
  ( (V!33186 (val!10626 Int)) )
))
(declare-datatypes ((ValueCell!10094 0))(
  ( (ValueCellFull!10094 (v!13183 V!33185)) (EmptyCell!10094) )
))
(declare-fun mapValue!33706 () ValueCell!10094)

(declare-fun mapKey!33706 () (_ BitVec 32))

(declare-datatypes ((array!58405 0))(
  ( (array!58406 (arr!28076 (Array (_ BitVec 32) ValueCell!10094)) (size!28555 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58405)

(declare-fun mapRest!33706 () (Array (_ BitVec 32) ValueCell!10094))

(assert (=> mapNonEmpty!33706 (= (arr!28076 _values!1386) (store mapRest!33706 mapKey!33706 mapValue!33706))))

(declare-fun mapIsEmpty!33706 () Bool)

(assert (=> mapIsEmpty!33706 mapRes!33706))

(declare-fun b!957708 () Bool)

(declare-fun res!641066 () Bool)

(declare-fun e!539907 () Bool)

(assert (=> b!957708 (=> (not res!641066) (not e!539907))))

(declare-datatypes ((array!58407 0))(
  ( (array!58408 (arr!28077 (Array (_ BitVec 32) (_ BitVec 64))) (size!28556 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58407)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58407 (_ BitVec 32)) Bool)

(assert (=> b!957708 (= res!641066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957709 () Bool)

(declare-fun res!641064 () Bool)

(assert (=> b!957709 (=> (not res!641064) (not e!539907))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957709 (= res!641064 (and (= (size!28555 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28556 _keys!1668) (size!28555 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957710 () Bool)

(assert (=> b!957710 (= e!539907 false)))

(declare-fun lt!430368 () Bool)

(declare-datatypes ((List!19520 0))(
  ( (Nil!19517) (Cons!19516 (h!20678 (_ BitVec 64)) (t!27883 List!19520)) )
))
(declare-fun arrayNoDuplicates!0 (array!58407 (_ BitVec 32) List!19520) Bool)

(assert (=> b!957710 (= lt!430368 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19517))))

(declare-fun b!957712 () Bool)

(declare-fun e!539906 () Bool)

(assert (=> b!957712 (= e!539906 (and e!539908 mapRes!33706))))

(declare-fun condMapEmpty!33706 () Bool)

(declare-fun mapDefault!33706 () ValueCell!10094)

