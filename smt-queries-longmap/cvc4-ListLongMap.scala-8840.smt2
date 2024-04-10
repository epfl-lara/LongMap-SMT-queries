; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107268 () Bool)

(assert start!107268)

(declare-fun b!1271435 () Bool)

(declare-fun e!725013 () Bool)

(declare-fun tp_is_empty!32957 () Bool)

(assert (=> b!1271435 (= e!725013 tp_is_empty!32957)))

(declare-fun b!1271436 () Bool)

(declare-fun e!725011 () Bool)

(assert (=> b!1271436 (= e!725011 false)))

(declare-fun lt!574872 () Bool)

(declare-datatypes ((array!83164 0))(
  ( (array!83165 (arr!40119 (Array (_ BitVec 32) (_ BitVec 64))) (size!40655 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83164)

(declare-datatypes ((List!28525 0))(
  ( (Nil!28522) (Cons!28521 (h!29730 (_ BitVec 64)) (t!42054 List!28525)) )
))
(declare-fun arrayNoDuplicates!0 (array!83164 (_ BitVec 32) List!28525) Bool)

(assert (=> b!1271436 (= lt!574872 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28522))))

(declare-fun b!1271437 () Bool)

(declare-fun e!725010 () Bool)

(declare-fun e!725012 () Bool)

(declare-fun mapRes!51016 () Bool)

(assert (=> b!1271437 (= e!725010 (and e!725012 mapRes!51016))))

(declare-fun condMapEmpty!51016 () Bool)

(declare-datatypes ((V!49135 0))(
  ( (V!49136 (val!16553 Int)) )
))
(declare-datatypes ((ValueCell!15625 0))(
  ( (ValueCellFull!15625 (v!19190 V!49135)) (EmptyCell!15625) )
))
(declare-datatypes ((array!83166 0))(
  ( (array!83167 (arr!40120 (Array (_ BitVec 32) ValueCell!15625)) (size!40656 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83166)

(declare-fun mapDefault!51016 () ValueCell!15625)

