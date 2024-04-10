; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72792 () Bool)

(assert start!72792)

(declare-fun b!844781 () Bool)

(declare-fun res!573929 () Bool)

(declare-fun e!471559 () Bool)

(assert (=> b!844781 (=> (not res!573929) (not e!471559))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47912 0))(
  ( (array!47913 (arr!22987 (Array (_ BitVec 32) (_ BitVec 64))) (size!23427 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47912)

(declare-datatypes ((V!26171 0))(
  ( (V!26172 (val!7969 Int)) )
))
(declare-datatypes ((ValueCell!7482 0))(
  ( (ValueCellFull!7482 (v!10394 V!26171)) (EmptyCell!7482) )
))
(declare-datatypes ((array!47914 0))(
  ( (array!47915 (arr!22988 (Array (_ BitVec 32) ValueCell!7482)) (size!23428 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47914)

(assert (=> b!844781 (= res!573929 (and (= (size!23428 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23427 _keys!868) (size!23428 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844782 () Bool)

(declare-fun e!471560 () Bool)

(declare-fun tp_is_empty!15843 () Bool)

(assert (=> b!844782 (= e!471560 tp_is_empty!15843)))

(declare-fun mapIsEmpty!25364 () Bool)

(declare-fun mapRes!25364 () Bool)

(assert (=> mapIsEmpty!25364 mapRes!25364))

(declare-fun b!844783 () Bool)

(declare-fun res!573927 () Bool)

(assert (=> b!844783 (=> (not res!573927) (not e!471559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47912 (_ BitVec 32)) Bool)

(assert (=> b!844783 (= res!573927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573928 () Bool)

(assert (=> start!72792 (=> (not res!573928) (not e!471559))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72792 (= res!573928 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23427 _keys!868))))))

(assert (=> start!72792 e!471559))

(assert (=> start!72792 true))

(declare-fun array_inv!18276 (array!47912) Bool)

(assert (=> start!72792 (array_inv!18276 _keys!868)))

(declare-fun e!471562 () Bool)

(declare-fun array_inv!18277 (array!47914) Bool)

(assert (=> start!72792 (and (array_inv!18277 _values!688) e!471562)))

(declare-fun mapNonEmpty!25364 () Bool)

(declare-fun tp!48682 () Bool)

(assert (=> mapNonEmpty!25364 (= mapRes!25364 (and tp!48682 e!471560))))

(declare-fun mapValue!25364 () ValueCell!7482)

(declare-fun mapKey!25364 () (_ BitVec 32))

(declare-fun mapRest!25364 () (Array (_ BitVec 32) ValueCell!7482))

(assert (=> mapNonEmpty!25364 (= (arr!22988 _values!688) (store mapRest!25364 mapKey!25364 mapValue!25364))))

(declare-fun b!844784 () Bool)

(assert (=> b!844784 (= e!471559 false)))

(declare-fun lt!381331 () Bool)

(declare-datatypes ((List!16284 0))(
  ( (Nil!16281) (Cons!16280 (h!17411 (_ BitVec 64)) (t!22655 List!16284)) )
))
(declare-fun arrayNoDuplicates!0 (array!47912 (_ BitVec 32) List!16284) Bool)

(assert (=> b!844784 (= lt!381331 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16281))))

(declare-fun b!844785 () Bool)

(declare-fun e!471558 () Bool)

(assert (=> b!844785 (= e!471562 (and e!471558 mapRes!25364))))

(declare-fun condMapEmpty!25364 () Bool)

(declare-fun mapDefault!25364 () ValueCell!7482)

(assert (=> b!844785 (= condMapEmpty!25364 (= (arr!22988 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7482)) mapDefault!25364)))))

(declare-fun b!844786 () Bool)

(declare-fun res!573926 () Bool)

(assert (=> b!844786 (=> (not res!573926) (not e!471559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844786 (= res!573926 (validMask!0 mask!1196))))

(declare-fun b!844787 () Bool)

(assert (=> b!844787 (= e!471558 tp_is_empty!15843)))

(assert (= (and start!72792 res!573928) b!844786))

(assert (= (and b!844786 res!573926) b!844781))

(assert (= (and b!844781 res!573929) b!844783))

(assert (= (and b!844783 res!573927) b!844784))

(assert (= (and b!844785 condMapEmpty!25364) mapIsEmpty!25364))

(assert (= (and b!844785 (not condMapEmpty!25364)) mapNonEmpty!25364))

(get-info :version)

(assert (= (and mapNonEmpty!25364 ((_ is ValueCellFull!7482) mapValue!25364)) b!844782))

(assert (= (and b!844785 ((_ is ValueCellFull!7482) mapDefault!25364)) b!844787))

(assert (= start!72792 b!844785))

(declare-fun m!786885 () Bool)

(assert (=> b!844783 m!786885))

(declare-fun m!786887 () Bool)

(assert (=> start!72792 m!786887))

(declare-fun m!786889 () Bool)

(assert (=> start!72792 m!786889))

(declare-fun m!786891 () Bool)

(assert (=> b!844784 m!786891))

(declare-fun m!786893 () Bool)

(assert (=> mapNonEmpty!25364 m!786893))

(declare-fun m!786895 () Bool)

(assert (=> b!844786 m!786895))

(check-sat (not b!844786) (not b!844784) tp_is_empty!15843 (not mapNonEmpty!25364) (not start!72792) (not b!844783))
(check-sat)
