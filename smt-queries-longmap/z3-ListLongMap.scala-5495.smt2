; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72922 () Bool)

(assert start!72922)

(declare-fun b!845285 () Bool)

(declare-fun e!471859 () Bool)

(declare-fun tp_is_empty!15805 () Bool)

(assert (=> b!845285 (= e!471859 tp_is_empty!15805)))

(declare-fun b!845286 () Bool)

(declare-fun e!471858 () Bool)

(assert (=> b!845286 (= e!471858 tp_is_empty!15805)))

(declare-fun mapNonEmpty!25307 () Bool)

(declare-fun mapRes!25307 () Bool)

(declare-fun tp!48626 () Bool)

(assert (=> mapNonEmpty!25307 (= mapRes!25307 (and tp!48626 e!471859))))

(declare-datatypes ((V!26121 0))(
  ( (V!26122 (val!7950 Int)) )
))
(declare-datatypes ((ValueCell!7463 0))(
  ( (ValueCellFull!7463 (v!10375 V!26121)) (EmptyCell!7463) )
))
(declare-fun mapValue!25307 () ValueCell!7463)

(declare-fun mapRest!25307 () (Array (_ BitVec 32) ValueCell!7463))

(declare-fun mapKey!25307 () (_ BitVec 32))

(declare-datatypes ((array!47885 0))(
  ( (array!47886 (arr!22969 (Array (_ BitVec 32) ValueCell!7463)) (size!23410 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47885)

(assert (=> mapNonEmpty!25307 (= (arr!22969 _values!688) (store mapRest!25307 mapKey!25307 mapValue!25307))))

(declare-fun b!845287 () Bool)

(declare-fun res!574045 () Bool)

(declare-fun e!471856 () Bool)

(assert (=> b!845287 (=> (not res!574045) (not e!471856))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845287 (= res!574045 (validMask!0 mask!1196))))

(declare-fun b!845288 () Bool)

(declare-fun e!471855 () Bool)

(assert (=> b!845288 (= e!471855 (and e!471858 mapRes!25307))))

(declare-fun condMapEmpty!25307 () Bool)

(declare-fun mapDefault!25307 () ValueCell!7463)

(assert (=> b!845288 (= condMapEmpty!25307 (= (arr!22969 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7463)) mapDefault!25307)))))

(declare-fun mapIsEmpty!25307 () Bool)

(assert (=> mapIsEmpty!25307 mapRes!25307))

(declare-fun b!845290 () Bool)

(assert (=> b!845290 (= e!471856 false)))

(declare-fun lt!381635 () Bool)

(declare-datatypes ((array!47887 0))(
  ( (array!47888 (arr!22970 (Array (_ BitVec 32) (_ BitVec 64))) (size!23411 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47887)

(declare-datatypes ((List!16197 0))(
  ( (Nil!16194) (Cons!16193 (h!17330 (_ BitVec 64)) (t!22560 List!16197)) )
))
(declare-fun arrayNoDuplicates!0 (array!47887 (_ BitVec 32) List!16197) Bool)

(assert (=> b!845290 (= lt!381635 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16194))))

(declare-fun b!845291 () Bool)

(declare-fun res!574042 () Bool)

(assert (=> b!845291 (=> (not res!574042) (not e!471856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47887 (_ BitVec 32)) Bool)

(assert (=> b!845291 (= res!574042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!574043 () Bool)

(assert (=> start!72922 (=> (not res!574043) (not e!471856))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72922 (= res!574043 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23411 _keys!868))))))

(assert (=> start!72922 e!471856))

(assert (=> start!72922 true))

(declare-fun array_inv!18308 (array!47887) Bool)

(assert (=> start!72922 (array_inv!18308 _keys!868)))

(declare-fun array_inv!18309 (array!47885) Bool)

(assert (=> start!72922 (and (array_inv!18309 _values!688) e!471855)))

(declare-fun b!845289 () Bool)

(declare-fun res!574044 () Bool)

(assert (=> b!845289 (=> (not res!574044) (not e!471856))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!845289 (= res!574044 (and (= (size!23410 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23411 _keys!868) (size!23410 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72922 res!574043) b!845287))

(assert (= (and b!845287 res!574045) b!845289))

(assert (= (and b!845289 res!574044) b!845291))

(assert (= (and b!845291 res!574042) b!845290))

(assert (= (and b!845288 condMapEmpty!25307) mapIsEmpty!25307))

(assert (= (and b!845288 (not condMapEmpty!25307)) mapNonEmpty!25307))

(get-info :version)

(assert (= (and mapNonEmpty!25307 ((_ is ValueCellFull!7463) mapValue!25307)) b!845285))

(assert (= (and b!845288 ((_ is ValueCellFull!7463) mapDefault!25307)) b!845286))

(assert (= start!72922 b!845288))

(declare-fun m!787949 () Bool)

(assert (=> mapNonEmpty!25307 m!787949))

(declare-fun m!787951 () Bool)

(assert (=> b!845291 m!787951))

(declare-fun m!787953 () Bool)

(assert (=> start!72922 m!787953))

(declare-fun m!787955 () Bool)

(assert (=> start!72922 m!787955))

(declare-fun m!787957 () Bool)

(assert (=> b!845290 m!787957))

(declare-fun m!787959 () Bool)

(assert (=> b!845287 m!787959))

(check-sat (not b!845291) (not mapNonEmpty!25307) (not b!845290) (not b!845287) (not start!72922) tp_is_empty!15805)
(check-sat)
