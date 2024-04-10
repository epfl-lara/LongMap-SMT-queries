; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72706 () Bool)

(assert start!72706)

(declare-fun b!843878 () Bool)

(declare-fun res!573413 () Bool)

(declare-fun e!470916 () Bool)

(assert (=> b!843878 (=> (not res!573413) (not e!470916))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843878 (= res!573413 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25235 () Bool)

(declare-fun mapRes!25235 () Bool)

(declare-fun tp!48553 () Bool)

(declare-fun e!470917 () Bool)

(assert (=> mapNonEmpty!25235 (= mapRes!25235 (and tp!48553 e!470917))))

(declare-datatypes ((V!26057 0))(
  ( (V!26058 (val!7926 Int)) )
))
(declare-datatypes ((ValueCell!7439 0))(
  ( (ValueCellFull!7439 (v!10351 V!26057)) (EmptyCell!7439) )
))
(declare-fun mapRest!25235 () (Array (_ BitVec 32) ValueCell!7439))

(declare-fun mapValue!25235 () ValueCell!7439)

(declare-fun mapKey!25235 () (_ BitVec 32))

(declare-datatypes ((array!47758 0))(
  ( (array!47759 (arr!22910 (Array (_ BitVec 32) ValueCell!7439)) (size!23350 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47758)

(assert (=> mapNonEmpty!25235 (= (arr!22910 _values!688) (store mapRest!25235 mapKey!25235 mapValue!25235))))

(declare-fun res!573411 () Bool)

(assert (=> start!72706 (=> (not res!573411) (not e!470916))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47760 0))(
  ( (array!47761 (arr!22911 (Array (_ BitVec 32) (_ BitVec 64))) (size!23351 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47760)

(assert (=> start!72706 (= res!573411 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23351 _keys!868))))))

(assert (=> start!72706 e!470916))

(assert (=> start!72706 true))

(declare-fun array_inv!18218 (array!47760) Bool)

(assert (=> start!72706 (array_inv!18218 _keys!868)))

(declare-fun e!470915 () Bool)

(declare-fun array_inv!18219 (array!47758) Bool)

(assert (=> start!72706 (and (array_inv!18219 _values!688) e!470915)))

(declare-fun b!843879 () Bool)

(declare-fun res!573412 () Bool)

(assert (=> b!843879 (=> (not res!573412) (not e!470916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47760 (_ BitVec 32)) Bool)

(assert (=> b!843879 (= res!573412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25235 () Bool)

(assert (=> mapIsEmpty!25235 mapRes!25235))

(declare-fun b!843880 () Bool)

(assert (=> b!843880 (= e!470916 false)))

(declare-fun lt!381202 () Bool)

(declare-datatypes ((List!16253 0))(
  ( (Nil!16250) (Cons!16249 (h!17380 (_ BitVec 64)) (t!22624 List!16253)) )
))
(declare-fun arrayNoDuplicates!0 (array!47760 (_ BitVec 32) List!16253) Bool)

(assert (=> b!843880 (= lt!381202 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16250))))

(declare-fun b!843881 () Bool)

(declare-fun tp_is_empty!15757 () Bool)

(assert (=> b!843881 (= e!470917 tp_is_empty!15757)))

(declare-fun b!843882 () Bool)

(declare-fun e!470914 () Bool)

(assert (=> b!843882 (= e!470915 (and e!470914 mapRes!25235))))

(declare-fun condMapEmpty!25235 () Bool)

(declare-fun mapDefault!25235 () ValueCell!7439)

