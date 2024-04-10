; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107292 () Bool)

(assert start!107292)

(declare-fun b!1271651 () Bool)

(declare-fun res!846020 () Bool)

(declare-fun e!725193 () Bool)

(assert (=> b!1271651 (=> (not res!846020) (not e!725193))))

(declare-datatypes ((array!83210 0))(
  ( (array!83211 (arr!40142 (Array (_ BitVec 32) (_ BitVec 64))) (size!40678 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83210)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83210 (_ BitVec 32)) Bool)

(assert (=> b!1271651 (= res!846020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846018 () Bool)

(assert (=> start!107292 (=> (not res!846018) (not e!725193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107292 (= res!846018 (validMask!0 mask!1730))))

(assert (=> start!107292 e!725193))

(declare-datatypes ((V!49167 0))(
  ( (V!49168 (val!16565 Int)) )
))
(declare-datatypes ((ValueCell!15637 0))(
  ( (ValueCellFull!15637 (v!19202 V!49167)) (EmptyCell!15637) )
))
(declare-datatypes ((array!83212 0))(
  ( (array!83213 (arr!40143 (Array (_ BitVec 32) ValueCell!15637)) (size!40679 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83212)

(declare-fun e!725189 () Bool)

(declare-fun array_inv!30533 (array!83212) Bool)

(assert (=> start!107292 (and (array_inv!30533 _values!1134) e!725189)))

(assert (=> start!107292 true))

(declare-fun array_inv!30534 (array!83210) Bool)

(assert (=> start!107292 (array_inv!30534 _keys!1364)))

(declare-fun b!1271652 () Bool)

(declare-fun e!725192 () Bool)

(declare-fun tp_is_empty!32981 () Bool)

(assert (=> b!1271652 (= e!725192 tp_is_empty!32981)))

(declare-fun b!1271653 () Bool)

(declare-fun e!725191 () Bool)

(declare-fun mapRes!51052 () Bool)

(assert (=> b!1271653 (= e!725189 (and e!725191 mapRes!51052))))

(declare-fun condMapEmpty!51052 () Bool)

(declare-fun mapDefault!51052 () ValueCell!15637)

