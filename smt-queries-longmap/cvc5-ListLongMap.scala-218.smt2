; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3990 () Bool)

(assert start!3990)

(declare-fun b_free!895 () Bool)

(declare-fun b_next!895 () Bool)

(assert (=> start!3990 (= b_free!895 (not b_next!895))))

(declare-fun tp!4104 () Bool)

(declare-fun b_and!1705 () Bool)

(assert (=> start!3990 (= tp!4104 b_and!1705)))

(declare-fun b!28851 () Bool)

(declare-fun res!17243 () Bool)

(declare-fun e!18654 () Bool)

(assert (=> b!28851 (=> (not res!17243) (not e!18654))))

(declare-datatypes ((array!1733 0))(
  ( (array!1734 (arr!820 (Array (_ BitVec 32) (_ BitVec 64))) (size!921 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1733)

(declare-datatypes ((List!681 0))(
  ( (Nil!678) (Cons!677 (h!1244 (_ BitVec 64)) (t!3374 List!681)) )
))
(declare-fun arrayNoDuplicates!0 (array!1733 (_ BitVec 32) List!681) Bool)

(assert (=> b!28851 (= res!17243 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!678))))

(declare-fun res!17244 () Bool)

(assert (=> start!3990 (=> (not res!17244) (not e!18654))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3990 (= res!17244 (validMask!0 mask!2294))))

(assert (=> start!3990 e!18654))

(assert (=> start!3990 true))

(assert (=> start!3990 tp!4104))

(declare-datatypes ((V!1491 0))(
  ( (V!1492 (val!651 Int)) )
))
(declare-datatypes ((ValueCell!425 0))(
  ( (ValueCellFull!425 (v!1740 V!1491)) (EmptyCell!425) )
))
(declare-datatypes ((array!1735 0))(
  ( (array!1736 (arr!821 (Array (_ BitVec 32) ValueCell!425)) (size!922 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1735)

(declare-fun e!18653 () Bool)

(declare-fun array_inv!565 (array!1735) Bool)

(assert (=> start!3990 (and (array_inv!565 _values!1501) e!18653)))

(declare-fun array_inv!566 (array!1733) Bool)

(assert (=> start!3990 (array_inv!566 _keys!1833)))

(declare-fun tp_is_empty!1249 () Bool)

(assert (=> start!3990 tp_is_empty!1249))

(declare-fun b!28852 () Bool)

(declare-fun res!17245 () Bool)

(assert (=> b!28852 (=> (not res!17245) (not e!18654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1733 (_ BitVec 32)) Bool)

(assert (=> b!28852 (= res!17245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1402 () Bool)

(declare-fun mapRes!1402 () Bool)

(assert (=> mapIsEmpty!1402 mapRes!1402))

(declare-fun b!28853 () Bool)

(declare-fun e!18652 () Bool)

(assert (=> b!28853 (= e!18653 (and e!18652 mapRes!1402))))

(declare-fun condMapEmpty!1402 () Bool)

(declare-fun mapDefault!1402 () ValueCell!425)

