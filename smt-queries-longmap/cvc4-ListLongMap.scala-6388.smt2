; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82116 () Bool)

(assert start!82116)

(declare-fun b!957274 () Bool)

(declare-fun e!539551 () Bool)

(declare-fun tp_is_empty!21107 () Bool)

(assert (=> b!957274 (= e!539551 tp_is_empty!21107)))

(declare-fun mapIsEmpty!33637 () Bool)

(declare-fun mapRes!33637 () Bool)

(assert (=> mapIsEmpty!33637 mapRes!33637))

(declare-fun b!957275 () Bool)

(declare-fun res!640843 () Bool)

(declare-fun e!539547 () Bool)

(assert (=> b!957275 (=> (not res!640843) (not e!539547))))

(declare-datatypes ((array!58319 0))(
  ( (array!58320 (arr!28034 (Array (_ BitVec 32) (_ BitVec 64))) (size!28513 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58319)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58319 (_ BitVec 32)) Bool)

(assert (=> b!957275 (= res!640843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957276 () Bool)

(declare-fun res!640848 () Bool)

(assert (=> b!957276 (=> (not res!640848) (not e!539547))))

(declare-datatypes ((List!19505 0))(
  ( (Nil!19502) (Cons!19501 (h!20663 (_ BitVec 64)) (t!27868 List!19505)) )
))
(declare-fun noDuplicate!1365 (List!19505) Bool)

(assert (=> b!957276 (= res!640848 (noDuplicate!1365 Nil!19502))))

(declare-fun b!957277 () Bool)

(declare-fun e!539546 () Bool)

(assert (=> b!957277 (= e!539546 tp_is_empty!21107)))

(declare-fun b!957278 () Bool)

(declare-fun e!539550 () Bool)

(assert (=> b!957278 (= e!539550 (and e!539546 mapRes!33637))))

(declare-fun condMapEmpty!33637 () Bool)

(declare-datatypes ((V!33125 0))(
  ( (V!33126 (val!10604 Int)) )
))
(declare-datatypes ((ValueCell!10072 0))(
  ( (ValueCellFull!10072 (v!13160 V!33125)) (EmptyCell!10072) )
))
(declare-datatypes ((array!58321 0))(
  ( (array!58322 (arr!28035 (Array (_ BitVec 32) ValueCell!10072)) (size!28514 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58321)

(declare-fun mapDefault!33637 () ValueCell!10072)

