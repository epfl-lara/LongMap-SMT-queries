; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131690 () Bool)

(assert start!131690)

(declare-fun b!1542165 () Bool)

(declare-fun e!857901 () Bool)

(declare-fun tp_is_empty!37679 () Bool)

(assert (=> b!1542165 (= e!857901 tp_is_empty!37679)))

(declare-fun mapIsEmpty!58222 () Bool)

(declare-fun mapRes!58222 () Bool)

(assert (=> mapIsEmpty!58222 mapRes!58222))

(declare-fun res!1058356 () Bool)

(declare-fun e!857900 () Bool)

(assert (=> start!131690 (=> (not res!1058356) (not e!857900))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131690 (= res!1058356 (validMask!0 mask!926))))

(assert (=> start!131690 e!857900))

(assert (=> start!131690 true))

(declare-datatypes ((V!58681 0))(
  ( (V!58682 (val!18917 Int)) )
))
(declare-datatypes ((ValueCell!17929 0))(
  ( (ValueCellFull!17929 (v!21718 V!58681)) (EmptyCell!17929) )
))
(declare-datatypes ((array!102590 0))(
  ( (array!102591 (arr!49497 (Array (_ BitVec 32) ValueCell!17929)) (size!50047 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102590)

(declare-fun e!857903 () Bool)

(declare-fun array_inv!38511 (array!102590) Bool)

(assert (=> start!131690 (and (array_inv!38511 _values!470) e!857903)))

(declare-datatypes ((array!102592 0))(
  ( (array!102593 (arr!49498 (Array (_ BitVec 32) (_ BitVec 64))) (size!50048 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102592)

(declare-fun array_inv!38512 (array!102592) Bool)

(assert (=> start!131690 (array_inv!38512 _keys!618)))

(declare-fun b!1542166 () Bool)

(assert (=> b!1542166 (= e!857900 false)))

(declare-fun lt!665771 () Bool)

(declare-datatypes ((List!35864 0))(
  ( (Nil!35861) (Cons!35860 (h!37305 (_ BitVec 64)) (t!50558 List!35864)) )
))
(declare-fun arrayNoDuplicates!0 (array!102592 (_ BitVec 32) List!35864) Bool)

(assert (=> b!1542166 (= lt!665771 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35861))))

(declare-fun b!1542167 () Bool)

(declare-fun e!857904 () Bool)

(assert (=> b!1542167 (= e!857904 tp_is_empty!37679)))

(declare-fun b!1542168 () Bool)

(declare-fun res!1058357 () Bool)

(assert (=> b!1542168 (=> (not res!1058357) (not e!857900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102592 (_ BitVec 32)) Bool)

(assert (=> b!1542168 (= res!1058357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542169 () Bool)

(assert (=> b!1542169 (= e!857903 (and e!857901 mapRes!58222))))

(declare-fun condMapEmpty!58222 () Bool)

(declare-fun mapDefault!58222 () ValueCell!17929)

