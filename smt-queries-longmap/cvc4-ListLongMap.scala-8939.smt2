; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108364 () Bool)

(assert start!108364)

(declare-fun b!1278947 () Bool)

(declare-fun e!730700 () Bool)

(assert (=> b!1278947 (= e!730700 false)))

(declare-fun lt!575957 () Bool)

(declare-datatypes ((array!84190 0))(
  ( (array!84191 (arr!40599 (Array (_ BitVec 32) (_ BitVec 64))) (size!41149 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84190)

(declare-datatypes ((List!28756 0))(
  ( (Nil!28753) (Cons!28752 (h!29961 (_ BitVec 64)) (t!42296 List!28756)) )
))
(declare-fun arrayNoDuplicates!0 (array!84190 (_ BitVec 32) List!28756) Bool)

(assert (=> b!1278947 (= lt!575957 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28753))))

(declare-fun b!1278948 () Bool)

(declare-fun e!730698 () Bool)

(declare-fun tp_is_empty!33551 () Bool)

(assert (=> b!1278948 (= e!730698 tp_is_empty!33551)))

(declare-fun b!1278949 () Bool)

(declare-fun e!730699 () Bool)

(declare-fun mapRes!51878 () Bool)

(assert (=> b!1278949 (= e!730699 (and e!730698 mapRes!51878))))

(declare-fun condMapEmpty!51878 () Bool)

(declare-datatypes ((V!49837 0))(
  ( (V!49838 (val!16850 Int)) )
))
(declare-datatypes ((ValueCell!15877 0))(
  ( (ValueCellFull!15877 (v!19450 V!49837)) (EmptyCell!15877) )
))
(declare-datatypes ((array!84192 0))(
  ( (array!84193 (arr!40600 (Array (_ BitVec 32) ValueCell!15877)) (size!41150 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84192)

(declare-fun mapDefault!51878 () ValueCell!15877)

