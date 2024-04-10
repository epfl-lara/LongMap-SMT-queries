; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72572 () Bool)

(assert start!72572)

(declare-fun b!842471 () Bool)

(declare-fun res!572609 () Bool)

(declare-fun e!469911 () Bool)

(assert (=> b!842471 (=> (not res!572609) (not e!469911))))

(declare-datatypes ((array!47520 0))(
  ( (array!47521 (arr!22791 (Array (_ BitVec 32) (_ BitVec 64))) (size!23231 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47520)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47520 (_ BitVec 32)) Bool)

(assert (=> b!842471 (= res!572609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842472 () Bool)

(declare-fun res!572608 () Bool)

(assert (=> b!842472 (=> (not res!572608) (not e!469911))))

(declare-datatypes ((V!25877 0))(
  ( (V!25878 (val!7859 Int)) )
))
(declare-datatypes ((ValueCell!7372 0))(
  ( (ValueCellFull!7372 (v!10284 V!25877)) (EmptyCell!7372) )
))
(declare-datatypes ((array!47522 0))(
  ( (array!47523 (arr!22792 (Array (_ BitVec 32) ValueCell!7372)) (size!23232 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47522)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842472 (= res!572608 (and (= (size!23232 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23231 _keys!868) (size!23232 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25034 () Bool)

(declare-fun mapRes!25034 () Bool)

(declare-fun tp!48352 () Bool)

(declare-fun e!469909 () Bool)

(assert (=> mapNonEmpty!25034 (= mapRes!25034 (and tp!48352 e!469909))))

(declare-fun mapRest!25034 () (Array (_ BitVec 32) ValueCell!7372))

(declare-fun mapKey!25034 () (_ BitVec 32))

(declare-fun mapValue!25034 () ValueCell!7372)

(assert (=> mapNonEmpty!25034 (= (arr!22792 _values!688) (store mapRest!25034 mapKey!25034 mapValue!25034))))

(declare-fun res!572607 () Bool)

(assert (=> start!72572 (=> (not res!572607) (not e!469911))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72572 (= res!572607 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23231 _keys!868))))))

(assert (=> start!72572 e!469911))

(assert (=> start!72572 true))

(declare-fun array_inv!18138 (array!47520) Bool)

(assert (=> start!72572 (array_inv!18138 _keys!868)))

(declare-fun e!469908 () Bool)

(declare-fun array_inv!18139 (array!47522) Bool)

(assert (=> start!72572 (and (array_inv!18139 _values!688) e!469908)))

(declare-fun b!842473 () Bool)

(declare-fun e!469912 () Bool)

(declare-fun tp_is_empty!15623 () Bool)

(assert (=> b!842473 (= e!469912 tp_is_empty!15623)))

(declare-fun b!842474 () Bool)

(assert (=> b!842474 (= e!469911 false)))

(declare-fun lt!381001 () Bool)

(declare-datatypes ((List!16212 0))(
  ( (Nil!16209) (Cons!16208 (h!17339 (_ BitVec 64)) (t!22583 List!16212)) )
))
(declare-fun arrayNoDuplicates!0 (array!47520 (_ BitVec 32) List!16212) Bool)

(assert (=> b!842474 (= lt!381001 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16209))))

(declare-fun b!842475 () Bool)

(assert (=> b!842475 (= e!469908 (and e!469912 mapRes!25034))))

(declare-fun condMapEmpty!25034 () Bool)

(declare-fun mapDefault!25034 () ValueCell!7372)

