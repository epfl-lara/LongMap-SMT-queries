; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82182 () Bool)

(assert start!82182)

(declare-fun b!957821 () Bool)

(declare-fun e!539985 () Bool)

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((array!58425 0))(
  ( (array!58426 (arr!28086 (Array (_ BitVec 32) (_ BitVec 64))) (size!28565 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58425)

(assert (=> b!957821 (= e!539985 (bvsgt from!2064 (size!28565 _keys!1668)))))

(declare-fun b!957822 () Bool)

(declare-fun e!539982 () Bool)

(declare-fun tp_is_empty!21161 () Bool)

(assert (=> b!957822 (= e!539982 tp_is_empty!21161)))

(declare-fun b!957823 () Bool)

(declare-fun res!641133 () Bool)

(assert (=> b!957823 (=> (not res!641133) (not e!539985))))

(declare-datatypes ((List!19525 0))(
  ( (Nil!19522) (Cons!19521 (h!20683 (_ BitVec 64)) (t!27888 List!19525)) )
))
(declare-fun arrayNoDuplicates!0 (array!58425 (_ BitVec 32) List!19525) Bool)

(assert (=> b!957823 (= res!641133 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19522))))

(declare-fun b!957824 () Bool)

(declare-fun res!641138 () Bool)

(assert (=> b!957824 (=> (not res!641138) (not e!539985))))

(declare-fun i!793 () (_ BitVec 32))

(assert (=> b!957824 (= res!641138 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28565 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28565 _keys!1668))))))

(declare-fun b!957825 () Bool)

(declare-fun e!539983 () Bool)

(declare-fun mapRes!33721 () Bool)

(assert (=> b!957825 (= e!539983 (and e!539982 mapRes!33721))))

(declare-fun condMapEmpty!33721 () Bool)

(declare-datatypes ((V!33197 0))(
  ( (V!33198 (val!10631 Int)) )
))
(declare-datatypes ((ValueCell!10099 0))(
  ( (ValueCellFull!10099 (v!13188 V!33197)) (EmptyCell!10099) )
))
(declare-datatypes ((array!58427 0))(
  ( (array!58428 (arr!28087 (Array (_ BitVec 32) ValueCell!10099)) (size!28566 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58427)

(declare-fun mapDefault!33721 () ValueCell!10099)

