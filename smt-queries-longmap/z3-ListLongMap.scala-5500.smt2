; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72786 () Bool)

(assert start!72786)

(declare-fun res!573890 () Bool)

(declare-fun e!471513 () Bool)

(assert (=> start!72786 (=> (not res!573890) (not e!471513))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47900 0))(
  ( (array!47901 (arr!22981 (Array (_ BitVec 32) (_ BitVec 64))) (size!23421 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47900)

(assert (=> start!72786 (= res!573890 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23421 _keys!868))))))

(assert (=> start!72786 e!471513))

(assert (=> start!72786 true))

(declare-fun array_inv!18270 (array!47900) Bool)

(assert (=> start!72786 (array_inv!18270 _keys!868)))

(declare-datatypes ((V!26163 0))(
  ( (V!26164 (val!7966 Int)) )
))
(declare-datatypes ((ValueCell!7479 0))(
  ( (ValueCellFull!7479 (v!10391 V!26163)) (EmptyCell!7479) )
))
(declare-datatypes ((array!47902 0))(
  ( (array!47903 (arr!22982 (Array (_ BitVec 32) ValueCell!7479)) (size!23422 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47902)

(declare-fun e!471515 () Bool)

(declare-fun array_inv!18271 (array!47902) Bool)

(assert (=> start!72786 (and (array_inv!18271 _values!688) e!471515)))

(declare-fun b!844718 () Bool)

(declare-fun res!573891 () Bool)

(assert (=> b!844718 (=> (not res!573891) (not e!471513))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!844718 (= res!573891 (and (= (size!23422 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23421 _keys!868) (size!23422 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!25355 () Bool)

(declare-fun mapRes!25355 () Bool)

(declare-fun tp!48673 () Bool)

(declare-fun e!471516 () Bool)

(assert (=> mapNonEmpty!25355 (= mapRes!25355 (and tp!48673 e!471516))))

(declare-fun mapValue!25355 () ValueCell!7479)

(declare-fun mapRest!25355 () (Array (_ BitVec 32) ValueCell!7479))

(declare-fun mapKey!25355 () (_ BitVec 32))

(assert (=> mapNonEmpty!25355 (= (arr!22982 _values!688) (store mapRest!25355 mapKey!25355 mapValue!25355))))

(declare-fun mapIsEmpty!25355 () Bool)

(assert (=> mapIsEmpty!25355 mapRes!25355))

(declare-fun b!844719 () Bool)

(assert (=> b!844719 (= e!471513 false)))

(declare-fun lt!381322 () Bool)

(declare-datatypes ((List!16281 0))(
  ( (Nil!16278) (Cons!16277 (h!17408 (_ BitVec 64)) (t!22652 List!16281)) )
))
(declare-fun arrayNoDuplicates!0 (array!47900 (_ BitVec 32) List!16281) Bool)

(assert (=> b!844719 (= lt!381322 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16278))))

(declare-fun b!844720 () Bool)

(declare-fun tp_is_empty!15837 () Bool)

(assert (=> b!844720 (= e!471516 tp_is_empty!15837)))

(declare-fun b!844721 () Bool)

(declare-fun res!573893 () Bool)

(assert (=> b!844721 (=> (not res!573893) (not e!471513))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844721 (= res!573893 (validMask!0 mask!1196))))

(declare-fun b!844722 () Bool)

(declare-fun e!471517 () Bool)

(assert (=> b!844722 (= e!471517 tp_is_empty!15837)))

(declare-fun b!844723 () Bool)

(assert (=> b!844723 (= e!471515 (and e!471517 mapRes!25355))))

(declare-fun condMapEmpty!25355 () Bool)

(declare-fun mapDefault!25355 () ValueCell!7479)

(assert (=> b!844723 (= condMapEmpty!25355 (= (arr!22982 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7479)) mapDefault!25355)))))

(declare-fun b!844724 () Bool)

(declare-fun res!573892 () Bool)

(assert (=> b!844724 (=> (not res!573892) (not e!471513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47900 (_ BitVec 32)) Bool)

(assert (=> b!844724 (= res!573892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72786 res!573890) b!844721))

(assert (= (and b!844721 res!573893) b!844718))

(assert (= (and b!844718 res!573891) b!844724))

(assert (= (and b!844724 res!573892) b!844719))

(assert (= (and b!844723 condMapEmpty!25355) mapIsEmpty!25355))

(assert (= (and b!844723 (not condMapEmpty!25355)) mapNonEmpty!25355))

(get-info :version)

(assert (= (and mapNonEmpty!25355 ((_ is ValueCellFull!7479) mapValue!25355)) b!844720))

(assert (= (and b!844723 ((_ is ValueCellFull!7479) mapDefault!25355)) b!844722))

(assert (= start!72786 b!844723))

(declare-fun m!786849 () Bool)

(assert (=> b!844721 m!786849))

(declare-fun m!786851 () Bool)

(assert (=> start!72786 m!786851))

(declare-fun m!786853 () Bool)

(assert (=> start!72786 m!786853))

(declare-fun m!786855 () Bool)

(assert (=> mapNonEmpty!25355 m!786855))

(declare-fun m!786857 () Bool)

(assert (=> b!844724 m!786857))

(declare-fun m!786859 () Bool)

(assert (=> b!844719 m!786859))

(check-sat (not start!72786) (not b!844719) (not mapNonEmpty!25355) (not b!844724) tp_is_empty!15837 (not b!844721))
(check-sat)
