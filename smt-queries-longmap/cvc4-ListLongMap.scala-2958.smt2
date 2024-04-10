; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41988 () Bool)

(assert start!41988)

(declare-fun b_free!11561 () Bool)

(declare-fun b_next!11561 () Bool)

(assert (=> start!41988 (= b_free!11561 (not b_next!11561))))

(declare-fun tp!40698 () Bool)

(declare-fun b_and!19959 () Bool)

(assert (=> start!41988 (= tp!40698 b_and!19959)))

(declare-fun res!280150 () Bool)

(declare-fun e!274412 () Bool)

(assert (=> start!41988 (=> (not res!280150) (not e!274412))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41988 (= res!280150 (validMask!0 mask!1365))))

(assert (=> start!41988 e!274412))

(declare-fun tp_is_empty!12989 () Bool)

(assert (=> start!41988 tp_is_empty!12989))

(assert (=> start!41988 tp!40698))

(assert (=> start!41988 true))

(declare-datatypes ((array!29753 0))(
  ( (array!29754 (arr!14302 (Array (_ BitVec 32) (_ BitVec 64))) (size!14654 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29753)

(declare-fun array_inv!10324 (array!29753) Bool)

(assert (=> start!41988 (array_inv!10324 _keys!1025)))

(declare-datatypes ((V!18423 0))(
  ( (V!18424 (val!6539 Int)) )
))
(declare-datatypes ((ValueCell!6151 0))(
  ( (ValueCellFull!6151 (v!8828 V!18423)) (EmptyCell!6151) )
))
(declare-datatypes ((array!29755 0))(
  ( (array!29756 (arr!14303 (Array (_ BitVec 32) ValueCell!6151)) (size!14655 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29755)

(declare-fun e!274413 () Bool)

(declare-fun array_inv!10325 (array!29755) Bool)

(assert (=> start!41988 (and (array_inv!10325 _values!833) e!274413)))

(declare-fun b!468786 () Bool)

(declare-fun e!274414 () Bool)

(assert (=> b!468786 (= e!274414 tp_is_empty!12989)))

(declare-fun b!468787 () Bool)

(declare-fun res!280151 () Bool)

(assert (=> b!468787 (=> (not res!280151) (not e!274412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29753 (_ BitVec 32)) Bool)

(assert (=> b!468787 (= res!280151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21178 () Bool)

(declare-fun mapRes!21178 () Bool)

(declare-fun tp!40699 () Bool)

(declare-fun e!274410 () Bool)

(assert (=> mapNonEmpty!21178 (= mapRes!21178 (and tp!40699 e!274410))))

(declare-fun mapRest!21178 () (Array (_ BitVec 32) ValueCell!6151))

(declare-fun mapValue!21178 () ValueCell!6151)

(declare-fun mapKey!21178 () (_ BitVec 32))

(assert (=> mapNonEmpty!21178 (= (arr!14303 _values!833) (store mapRest!21178 mapKey!21178 mapValue!21178))))

(declare-fun b!468788 () Bool)

(assert (=> b!468788 (= e!274413 (and e!274414 mapRes!21178))))

(declare-fun condMapEmpty!21178 () Bool)

(declare-fun mapDefault!21178 () ValueCell!6151)

