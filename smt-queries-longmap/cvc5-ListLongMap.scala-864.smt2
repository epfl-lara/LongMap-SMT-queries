; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20280 () Bool)

(assert start!20280)

(declare-fun b_free!4939 () Bool)

(declare-fun b_next!4939 () Bool)

(assert (=> start!20280 (= b_free!4939 (not b_next!4939))))

(declare-fun tp!17848 () Bool)

(declare-fun b_and!11685 () Bool)

(assert (=> start!20280 (= tp!17848 b_and!11685)))

(declare-fun b!199634 () Bool)

(declare-fun res!94925 () Bool)

(declare-fun e!131021 () Bool)

(assert (=> b!199634 (=> (not res!94925) (not e!131021))))

(declare-datatypes ((array!8829 0))(
  ( (array!8830 (arr!4165 (Array (_ BitVec 32) (_ BitVec 64))) (size!4490 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8829)

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199634 (= res!94925 (= (select (arr!4165 _keys!825) i!601) k!843))))

(declare-fun b!199635 () Bool)

(declare-fun res!94928 () Bool)

(assert (=> b!199635 (=> (not res!94928) (not e!131021))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8829 (_ BitVec 32)) Bool)

(assert (=> b!199635 (= res!94928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!199636 () Bool)

(declare-fun res!94929 () Bool)

(assert (=> b!199636 (=> (not res!94929) (not e!131021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199636 (= res!94929 (validKeyInArray!0 k!843))))

(declare-fun b!199637 () Bool)

(declare-fun res!94926 () Bool)

(assert (=> b!199637 (=> (not res!94926) (not e!131021))))

(assert (=> b!199637 (= res!94926 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4490 _keys!825))))))

(declare-fun b!199638 () Bool)

(declare-fun res!94930 () Bool)

(assert (=> b!199638 (=> (not res!94930) (not e!131021))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6041 0))(
  ( (V!6042 (val!2442 Int)) )
))
(declare-datatypes ((ValueCell!2054 0))(
  ( (ValueCellFull!2054 (v!4412 V!6041)) (EmptyCell!2054) )
))
(declare-datatypes ((array!8831 0))(
  ( (array!8832 (arr!4166 (Array (_ BitVec 32) ValueCell!2054)) (size!4491 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8831)

(assert (=> b!199638 (= res!94930 (and (= (size!4491 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4490 _keys!825) (size!4491 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!94927 () Bool)

(assert (=> start!20280 (=> (not res!94927) (not e!131021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20280 (= res!94927 (validMask!0 mask!1149))))

(assert (=> start!20280 e!131021))

(declare-fun e!131020 () Bool)

(declare-fun array_inv!2735 (array!8831) Bool)

(assert (=> start!20280 (and (array_inv!2735 _values!649) e!131020)))

(assert (=> start!20280 true))

(declare-fun tp_is_empty!4795 () Bool)

(assert (=> start!20280 tp_is_empty!4795))

(declare-fun array_inv!2736 (array!8829) Bool)

(assert (=> start!20280 (array_inv!2736 _keys!825)))

(assert (=> start!20280 tp!17848))

(declare-fun b!199639 () Bool)

(declare-fun e!131022 () Bool)

(assert (=> b!199639 (= e!131022 tp_is_empty!4795)))

(declare-fun b!199640 () Bool)

(declare-fun res!94924 () Bool)

(assert (=> b!199640 (=> (not res!94924) (not e!131021))))

(declare-datatypes ((List!2610 0))(
  ( (Nil!2607) (Cons!2606 (h!3248 (_ BitVec 64)) (t!7541 List!2610)) )
))
(declare-fun arrayNoDuplicates!0 (array!8829 (_ BitVec 32) List!2610) Bool)

(assert (=> b!199640 (= res!94924 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2607))))

(declare-fun b!199641 () Bool)

(declare-fun mapRes!8261 () Bool)

(assert (=> b!199641 (= e!131020 (and e!131022 mapRes!8261))))

(declare-fun condMapEmpty!8261 () Bool)

(declare-fun mapDefault!8261 () ValueCell!2054)

