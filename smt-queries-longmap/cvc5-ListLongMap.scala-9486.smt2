; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112524 () Bool)

(assert start!112524)

(declare-fun b_free!30919 () Bool)

(declare-fun b_next!30919 () Bool)

(assert (=> start!112524 (= b_free!30919 (not b_next!30919))))

(declare-fun tp!108394 () Bool)

(declare-fun b_and!49827 () Bool)

(assert (=> start!112524 (= tp!108394 b_and!49827)))

(declare-fun b!1334742 () Bool)

(declare-fun res!885850 () Bool)

(declare-fun e!760174 () Bool)

(assert (=> b!1334742 (=> (not res!885850) (not e!760174))))

(declare-datatypes ((array!90520 0))(
  ( (array!90521 (arr!43726 (Array (_ BitVec 32) (_ BitVec 64))) (size!44276 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90520)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90520 (_ BitVec 32)) Bool)

(assert (=> b!1334742 (= res!885850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56917 () Bool)

(declare-fun mapRes!56917 () Bool)

(assert (=> mapIsEmpty!56917 mapRes!56917))

(declare-fun b!1334743 () Bool)

(declare-fun e!760173 () Bool)

(declare-fun tp_is_empty!36829 () Bool)

(assert (=> b!1334743 (= e!760173 tp_is_empty!36829)))

(declare-fun res!885849 () Bool)

(assert (=> start!112524 (=> (not res!885849) (not e!760174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112524 (= res!885849 (validMask!0 mask!1998))))

(assert (=> start!112524 e!760174))

(declare-datatypes ((V!54209 0))(
  ( (V!54210 (val!18489 Int)) )
))
(declare-datatypes ((ValueCell!17516 0))(
  ( (ValueCellFull!17516 (v!21126 V!54209)) (EmptyCell!17516) )
))
(declare-datatypes ((array!90522 0))(
  ( (array!90523 (arr!43727 (Array (_ BitVec 32) ValueCell!17516)) (size!44277 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90522)

(declare-fun e!760176 () Bool)

(declare-fun array_inv!32977 (array!90522) Bool)

(assert (=> start!112524 (and (array_inv!32977 _values!1320) e!760176)))

(assert (=> start!112524 true))

(declare-fun array_inv!32978 (array!90520) Bool)

(assert (=> start!112524 (array_inv!32978 _keys!1590)))

(assert (=> start!112524 tp!108394))

(assert (=> start!112524 tp_is_empty!36829))

(declare-fun b!1334744 () Bool)

(declare-fun e!760175 () Bool)

(assert (=> b!1334744 (= e!760176 (and e!760175 mapRes!56917))))

(declare-fun condMapEmpty!56917 () Bool)

(declare-fun mapDefault!56917 () ValueCell!17516)

