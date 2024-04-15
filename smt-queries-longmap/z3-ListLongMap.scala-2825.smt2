; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40900 () Bool)

(assert start!40900)

(declare-fun b_free!10849 () Bool)

(declare-fun b_next!10849 () Bool)

(assert (=> start!40900 (= b_free!10849 (not b_next!10849))))

(declare-fun tp!38374 () Bool)

(declare-fun b_and!18965 () Bool)

(assert (=> start!40900 (= tp!38374 b_and!18965)))

(declare-fun b!454456 () Bool)

(declare-fun res!270875 () Bool)

(declare-fun e!265820 () Bool)

(assert (=> b!454456 (=> (not res!270875) (not e!265820))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454456 (= res!270875 (validKeyInArray!0 k0!794))))

(declare-fun b!454457 () Bool)

(declare-fun e!265824 () Bool)

(declare-fun tp_is_empty!12187 () Bool)

(assert (=> b!454457 (= e!265824 tp_is_empty!12187)))

(declare-fun b!454458 () Bool)

(declare-fun res!270874 () Bool)

(assert (=> b!454458 (=> (not res!270874) (not e!265820))))

(declare-datatypes ((array!28171 0))(
  ( (array!28172 (arr!13529 (Array (_ BitVec 32) (_ BitVec 64))) (size!13882 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28171)

(declare-datatypes ((V!17355 0))(
  ( (V!17356 (val!6138 Int)) )
))
(declare-datatypes ((ValueCell!5750 0))(
  ( (ValueCellFull!5750 (v!8398 V!17355)) (EmptyCell!5750) )
))
(declare-datatypes ((array!28173 0))(
  ( (array!28174 (arr!13530 (Array (_ BitVec 32) ValueCell!5750)) (size!13883 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28173)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!454458 (= res!270874 (and (= (size!13883 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13882 _keys!709) (size!13883 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454459 () Bool)

(declare-fun e!265821 () Bool)

(assert (=> b!454459 (= e!265821 tp_is_empty!12187)))

(declare-fun b!454460 () Bool)

(declare-fun res!270871 () Bool)

(declare-fun e!265823 () Bool)

(assert (=> b!454460 (=> (not res!270871) (not e!265823))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454460 (= res!270871 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19921 () Bool)

(declare-fun mapRes!19921 () Bool)

(declare-fun tp!38373 () Bool)

(assert (=> mapNonEmpty!19921 (= mapRes!19921 (and tp!38373 e!265824))))

(declare-fun mapValue!19921 () ValueCell!5750)

(declare-fun mapRest!19921 () (Array (_ BitVec 32) ValueCell!5750))

(declare-fun mapKey!19921 () (_ BitVec 32))

(assert (=> mapNonEmpty!19921 (= (arr!13530 _values!549) (store mapRest!19921 mapKey!19921 mapValue!19921))))

(declare-fun b!454461 () Bool)

(declare-fun res!270876 () Bool)

(assert (=> b!454461 (=> (not res!270876) (not e!265823))))

(declare-fun lt!205960 () array!28171)

(declare-datatypes ((List!8158 0))(
  ( (Nil!8155) (Cons!8154 (h!9010 (_ BitVec 64)) (t!13977 List!8158)) )
))
(declare-fun arrayNoDuplicates!0 (array!28171 (_ BitVec 32) List!8158) Bool)

(assert (=> b!454461 (= res!270876 (arrayNoDuplicates!0 lt!205960 #b00000000000000000000000000000000 Nil!8155))))

(declare-fun b!454462 () Bool)

(declare-fun res!270867 () Bool)

(assert (=> b!454462 (=> (not res!270867) (not e!265820))))

(assert (=> b!454462 (= res!270867 (or (= (select (arr!13529 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13529 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!454463 () Bool)

(declare-fun res!270869 () Bool)

(assert (=> b!454463 (=> (not res!270869) (not e!265820))))

(assert (=> b!454463 (= res!270869 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8155))))

(declare-fun b!454464 () Bool)

(declare-fun e!265825 () Bool)

(assert (=> b!454464 (= e!265825 (and e!265821 mapRes!19921))))

(declare-fun condMapEmpty!19921 () Bool)

(declare-fun mapDefault!19921 () ValueCell!5750)

(assert (=> b!454464 (= condMapEmpty!19921 (= (arr!13530 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5750)) mapDefault!19921)))))

(declare-fun res!270868 () Bool)

(assert (=> start!40900 (=> (not res!270868) (not e!265820))))

(assert (=> start!40900 (= res!270868 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13882 _keys!709))))))

(assert (=> start!40900 e!265820))

(assert (=> start!40900 tp_is_empty!12187))

(assert (=> start!40900 tp!38374))

(assert (=> start!40900 true))

(declare-fun array_inv!9860 (array!28173) Bool)

(assert (=> start!40900 (and (array_inv!9860 _values!549) e!265825)))

(declare-fun array_inv!9861 (array!28171) Bool)

(assert (=> start!40900 (array_inv!9861 _keys!709)))

(declare-fun b!454465 () Bool)

(declare-fun res!270873 () Bool)

(assert (=> b!454465 (=> (not res!270873) (not e!265820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454465 (= res!270873 (validMask!0 mask!1025))))

(declare-fun b!454466 () Bool)

(declare-fun res!270878 () Bool)

(assert (=> b!454466 (=> (not res!270878) (not e!265820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28171 (_ BitVec 32)) Bool)

(assert (=> b!454466 (= res!270878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19921 () Bool)

(assert (=> mapIsEmpty!19921 mapRes!19921))

(declare-fun b!454467 () Bool)

(assert (=> b!454467 (= e!265823 false)))

(declare-fun minValue!515 () V!17355)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17355)

(declare-fun v!412 () V!17355)

(declare-datatypes ((tuple2!8098 0))(
  ( (tuple2!8099 (_1!4060 (_ BitVec 64)) (_2!4060 V!17355)) )
))
(declare-datatypes ((List!8159 0))(
  ( (Nil!8156) (Cons!8155 (h!9011 tuple2!8098) (t!13978 List!8159)) )
))
(declare-datatypes ((ListLongMap!7001 0))(
  ( (ListLongMap!7002 (toList!3516 List!8159)) )
))
(declare-fun lt!205961 () ListLongMap!7001)

(declare-fun getCurrentListMapNoExtraKeys!1711 (array!28171 array!28173 (_ BitVec 32) (_ BitVec 32) V!17355 V!17355 (_ BitVec 32) Int) ListLongMap!7001)

(assert (=> b!454467 (= lt!205961 (getCurrentListMapNoExtraKeys!1711 lt!205960 (array!28174 (store (arr!13530 _values!549) i!563 (ValueCellFull!5750 v!412)) (size!13883 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!205959 () ListLongMap!7001)

(assert (=> b!454467 (= lt!205959 (getCurrentListMapNoExtraKeys!1711 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454468 () Bool)

(declare-fun res!270870 () Bool)

(assert (=> b!454468 (=> (not res!270870) (not e!265820))))

(declare-fun arrayContainsKey!0 (array!28171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454468 (= res!270870 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454469 () Bool)

(assert (=> b!454469 (= e!265820 e!265823)))

(declare-fun res!270872 () Bool)

(assert (=> b!454469 (=> (not res!270872) (not e!265823))))

(assert (=> b!454469 (= res!270872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205960 mask!1025))))

(assert (=> b!454469 (= lt!205960 (array!28172 (store (arr!13529 _keys!709) i!563 k0!794) (size!13882 _keys!709)))))

(declare-fun b!454470 () Bool)

(declare-fun res!270877 () Bool)

(assert (=> b!454470 (=> (not res!270877) (not e!265820))))

(assert (=> b!454470 (= res!270877 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13882 _keys!709))))))

(assert (= (and start!40900 res!270868) b!454465))

(assert (= (and b!454465 res!270873) b!454458))

(assert (= (and b!454458 res!270874) b!454466))

(assert (= (and b!454466 res!270878) b!454463))

(assert (= (and b!454463 res!270869) b!454470))

(assert (= (and b!454470 res!270877) b!454456))

(assert (= (and b!454456 res!270875) b!454462))

(assert (= (and b!454462 res!270867) b!454468))

(assert (= (and b!454468 res!270870) b!454469))

(assert (= (and b!454469 res!270872) b!454461))

(assert (= (and b!454461 res!270876) b!454460))

(assert (= (and b!454460 res!270871) b!454467))

(assert (= (and b!454464 condMapEmpty!19921) mapIsEmpty!19921))

(assert (= (and b!454464 (not condMapEmpty!19921)) mapNonEmpty!19921))

(get-info :version)

(assert (= (and mapNonEmpty!19921 ((_ is ValueCellFull!5750) mapValue!19921)) b!454457))

(assert (= (and b!454464 ((_ is ValueCellFull!5750) mapDefault!19921)) b!454459))

(assert (= start!40900 b!454464))

(declare-fun m!438017 () Bool)

(assert (=> start!40900 m!438017))

(declare-fun m!438019 () Bool)

(assert (=> start!40900 m!438019))

(declare-fun m!438021 () Bool)

(assert (=> b!454462 m!438021))

(declare-fun m!438023 () Bool)

(assert (=> b!454469 m!438023))

(declare-fun m!438025 () Bool)

(assert (=> b!454469 m!438025))

(declare-fun m!438027 () Bool)

(assert (=> b!454465 m!438027))

(declare-fun m!438029 () Bool)

(assert (=> b!454456 m!438029))

(declare-fun m!438031 () Bool)

(assert (=> b!454466 m!438031))

(declare-fun m!438033 () Bool)

(assert (=> b!454467 m!438033))

(declare-fun m!438035 () Bool)

(assert (=> b!454467 m!438035))

(declare-fun m!438037 () Bool)

(assert (=> b!454467 m!438037))

(declare-fun m!438039 () Bool)

(assert (=> mapNonEmpty!19921 m!438039))

(declare-fun m!438041 () Bool)

(assert (=> b!454463 m!438041))

(declare-fun m!438043 () Bool)

(assert (=> b!454461 m!438043))

(declare-fun m!438045 () Bool)

(assert (=> b!454468 m!438045))

(check-sat (not b!454456) (not b!454461) (not b!454468) (not b_next!10849) tp_is_empty!12187 (not b!454469) (not mapNonEmpty!19921) (not b!454463) (not b!454467) (not b!454466) (not start!40900) (not b!454465) b_and!18965)
(check-sat b_and!18965 (not b_next!10849))
