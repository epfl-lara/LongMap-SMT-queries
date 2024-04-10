; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97836 () Bool)

(assert start!97836)

(declare-fun b_free!23537 () Bool)

(declare-fun b_next!23537 () Bool)

(assert (=> start!97836 (= b_free!23537 (not b_next!23537))))

(declare-fun tp!83315 () Bool)

(declare-fun b_and!37857 () Bool)

(assert (=> start!97836 (= tp!83315 b_and!37857)))

(declare-fun b!1119738 () Bool)

(declare-fun e!637675 () Bool)

(declare-fun tp_is_empty!28067 () Bool)

(assert (=> b!1119738 (= e!637675 tp_is_empty!28067)))

(declare-fun b!1119739 () Bool)

(declare-fun e!637679 () Bool)

(assert (=> b!1119739 (= e!637679 tp_is_empty!28067)))

(declare-fun b!1119740 () Bool)

(declare-fun res!747985 () Bool)

(declare-fun e!637680 () Bool)

(assert (=> b!1119740 (=> (not res!747985) (not e!637680))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!73017 0))(
  ( (array!73018 (arr!35161 (Array (_ BitVec 32) (_ BitVec 64))) (size!35697 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73017)

(assert (=> b!1119740 (= res!747985 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35697 _keys!1208))))))

(declare-fun b!1119741 () Bool)

(declare-fun res!747984 () Bool)

(declare-fun e!637678 () Bool)

(assert (=> b!1119741 (=> (not res!747984) (not e!637678))))

(declare-fun lt!497837 () array!73017)

(declare-datatypes ((List!24464 0))(
  ( (Nil!24461) (Cons!24460 (h!25669 (_ BitVec 64)) (t!34993 List!24464)) )
))
(declare-fun arrayNoDuplicates!0 (array!73017 (_ BitVec 32) List!24464) Bool)

(assert (=> b!1119741 (= res!747984 (arrayNoDuplicates!0 lt!497837 #b00000000000000000000000000000000 Nil!24461))))

(declare-fun b!1119742 () Bool)

(declare-fun res!747980 () Bool)

(assert (=> b!1119742 (=> (not res!747980) (not e!637680))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73017 (_ BitVec 32)) Bool)

(assert (=> b!1119742 (= res!747980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119744 () Bool)

(declare-fun e!637674 () Bool)

(declare-fun mapRes!43918 () Bool)

(assert (=> b!1119744 (= e!637674 (and e!637679 mapRes!43918))))

(declare-fun condMapEmpty!43918 () Bool)

(declare-datatypes ((V!42549 0))(
  ( (V!42550 (val!14090 Int)) )
))
(declare-datatypes ((ValueCell!13324 0))(
  ( (ValueCellFull!13324 (v!16723 V!42549)) (EmptyCell!13324) )
))
(declare-datatypes ((array!73019 0))(
  ( (array!73020 (arr!35162 (Array (_ BitVec 32) ValueCell!13324)) (size!35698 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73019)

(declare-fun mapDefault!43918 () ValueCell!13324)

