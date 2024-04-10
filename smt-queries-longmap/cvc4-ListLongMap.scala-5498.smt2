; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72776 () Bool)

(assert start!72776)

(declare-fun b!844613 () Bool)

(declare-fun e!471441 () Bool)

(assert (=> b!844613 (= e!471441 false)))

(declare-fun lt!381307 () Bool)

(declare-datatypes ((array!47884 0))(
  ( (array!47885 (arr!22973 (Array (_ BitVec 32) (_ BitVec 64))) (size!23413 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47884)

(declare-datatypes ((List!16278 0))(
  ( (Nil!16275) (Cons!16274 (h!17405 (_ BitVec 64)) (t!22649 List!16278)) )
))
(declare-fun arrayNoDuplicates!0 (array!47884 (_ BitVec 32) List!16278) Bool)

(assert (=> b!844613 (= lt!381307 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16275))))

(declare-fun b!844614 () Bool)

(declare-fun e!471439 () Bool)

(declare-fun tp_is_empty!15827 () Bool)

(assert (=> b!844614 (= e!471439 tp_is_empty!15827)))

(declare-fun b!844615 () Bool)

(declare-fun res!573833 () Bool)

(assert (=> b!844615 (=> (not res!573833) (not e!471441))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26149 0))(
  ( (V!26150 (val!7961 Int)) )
))
(declare-datatypes ((ValueCell!7474 0))(
  ( (ValueCellFull!7474 (v!10386 V!26149)) (EmptyCell!7474) )
))
(declare-datatypes ((array!47886 0))(
  ( (array!47887 (arr!22974 (Array (_ BitVec 32) ValueCell!7474)) (size!23414 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47886)

(assert (=> b!844615 (= res!573833 (and (= (size!23414 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23413 _keys!868) (size!23414 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25340 () Bool)

(declare-fun mapRes!25340 () Bool)

(declare-fun tp!48658 () Bool)

(declare-fun e!471442 () Bool)

(assert (=> mapNonEmpty!25340 (= mapRes!25340 (and tp!48658 e!471442))))

(declare-fun mapKey!25340 () (_ BitVec 32))

(declare-fun mapRest!25340 () (Array (_ BitVec 32) ValueCell!7474))

(declare-fun mapValue!25340 () ValueCell!7474)

(assert (=> mapNonEmpty!25340 (= (arr!22974 _values!688) (store mapRest!25340 mapKey!25340 mapValue!25340))))

(declare-fun res!573831 () Bool)

(assert (=> start!72776 (=> (not res!573831) (not e!471441))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72776 (= res!573831 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23413 _keys!868))))))

(assert (=> start!72776 e!471441))

(assert (=> start!72776 true))

(declare-fun array_inv!18266 (array!47884) Bool)

(assert (=> start!72776 (array_inv!18266 _keys!868)))

(declare-fun e!471440 () Bool)

(declare-fun array_inv!18267 (array!47886) Bool)

(assert (=> start!72776 (and (array_inv!18267 _values!688) e!471440)))

(declare-fun b!844616 () Bool)

(assert (=> b!844616 (= e!471442 tp_is_empty!15827)))

(declare-fun b!844617 () Bool)

(declare-fun res!573832 () Bool)

(assert (=> b!844617 (=> (not res!573832) (not e!471441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844617 (= res!573832 (validMask!0 mask!1196))))

(declare-fun b!844618 () Bool)

(declare-fun res!573830 () Bool)

(assert (=> b!844618 (=> (not res!573830) (not e!471441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47884 (_ BitVec 32)) Bool)

(assert (=> b!844618 (= res!573830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844619 () Bool)

(assert (=> b!844619 (= e!471440 (and e!471439 mapRes!25340))))

(declare-fun condMapEmpty!25340 () Bool)

(declare-fun mapDefault!25340 () ValueCell!7474)

