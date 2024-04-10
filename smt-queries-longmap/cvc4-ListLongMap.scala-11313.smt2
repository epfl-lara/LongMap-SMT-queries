; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131786 () Bool)

(assert start!131786)

(declare-fun b!1543029 () Bool)

(declare-fun res!1058790 () Bool)

(declare-fun e!858624 () Bool)

(assert (=> b!1543029 (=> (not res!1058790) (not e!858624))))

(declare-datatypes ((array!102776 0))(
  ( (array!102777 (arr!49590 (Array (_ BitVec 32) (_ BitVec 64))) (size!50140 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102776)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102776 (_ BitVec 32)) Bool)

(assert (=> b!1543029 (= res!1058790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543030 () Bool)

(assert (=> b!1543030 (= e!858624 false)))

(declare-fun lt!665915 () Bool)

(declare-datatypes ((List!35902 0))(
  ( (Nil!35899) (Cons!35898 (h!37343 (_ BitVec 64)) (t!50596 List!35902)) )
))
(declare-fun arrayNoDuplicates!0 (array!102776 (_ BitVec 32) List!35902) Bool)

(assert (=> b!1543030 (= lt!665915 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35899))))

(declare-fun b!1543031 () Bool)

(declare-fun e!858621 () Bool)

(declare-fun tp_is_empty!37775 () Bool)

(assert (=> b!1543031 (= e!858621 tp_is_empty!37775)))

(declare-fun b!1543032 () Bool)

(declare-fun e!858622 () Bool)

(declare-fun e!858620 () Bool)

(declare-fun mapRes!58366 () Bool)

(assert (=> b!1543032 (= e!858622 (and e!858620 mapRes!58366))))

(declare-fun condMapEmpty!58366 () Bool)

(declare-datatypes ((V!58809 0))(
  ( (V!58810 (val!18965 Int)) )
))
(declare-datatypes ((ValueCell!17977 0))(
  ( (ValueCellFull!17977 (v!21766 V!58809)) (EmptyCell!17977) )
))
(declare-datatypes ((array!102778 0))(
  ( (array!102779 (arr!49591 (Array (_ BitVec 32) ValueCell!17977)) (size!50141 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102778)

(declare-fun mapDefault!58366 () ValueCell!17977)

