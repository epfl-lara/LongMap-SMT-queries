; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39686 () Bool)

(assert start!39686)

(declare-fun b_free!9967 () Bool)

(declare-fun b_next!9967 () Bool)

(assert (=> start!39686 (= b_free!9967 (not b_next!9967))))

(declare-fun tp!35430 () Bool)

(declare-fun b_and!17597 () Bool)

(assert (=> start!39686 (= tp!35430 b_and!17597)))

(declare-fun mapNonEmpty!18300 () Bool)

(declare-fun mapRes!18300 () Bool)

(declare-fun tp!35429 () Bool)

(declare-fun e!252911 () Bool)

(assert (=> mapNonEmpty!18300 (= mapRes!18300 (and tp!35429 e!252911))))

(declare-datatypes ((V!15931 0))(
  ( (V!15932 (val!5604 Int)) )
))
(declare-datatypes ((ValueCell!5216 0))(
  ( (ValueCellFull!5216 (v!7845 V!15931)) (EmptyCell!5216) )
))
(declare-fun mapRest!18300 () (Array (_ BitVec 32) ValueCell!5216))

(declare-datatypes ((array!26067 0))(
  ( (array!26068 (arr!12483 (Array (_ BitVec 32) ValueCell!5216)) (size!12836 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26067)

(declare-fun mapKey!18300 () (_ BitVec 32))

(declare-fun mapValue!18300 () ValueCell!5216)

(assert (=> mapNonEmpty!18300 (= (arr!12483 _values!549) (store mapRest!18300 mapKey!18300 mapValue!18300))))

(declare-fun b!426353 () Bool)

(declare-fun res!249929 () Bool)

(declare-fun e!252910 () Bool)

(assert (=> b!426353 (=> (not res!249929) (not e!252910))))

(declare-datatypes ((array!26069 0))(
  ( (array!26070 (arr!12484 (Array (_ BitVec 32) (_ BitVec 64))) (size!12837 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26069)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26069 (_ BitVec 32)) Bool)

(assert (=> b!426353 (= res!249929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426354 () Bool)

(declare-fun res!249924 () Bool)

(assert (=> b!426354 (=> (not res!249924) (not e!252910))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26069 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426354 (= res!249924 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426355 () Bool)

(declare-fun res!249920 () Bool)

(assert (=> b!426355 (=> (not res!249920) (not e!252910))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426355 (= res!249920 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12837 _keys!709))))))

(declare-fun b!426356 () Bool)

(declare-fun res!249927 () Bool)

(assert (=> b!426356 (=> (not res!249927) (not e!252910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426356 (= res!249927 (validKeyInArray!0 k0!794))))

(declare-fun b!426357 () Bool)

(declare-fun e!252912 () Bool)

(assert (=> b!426357 (= e!252912 (not true))))

(declare-fun minValue!515 () V!15931)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!194786 () array!26067)

(declare-fun v!412 () V!15931)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15931)

(declare-fun lt!194787 () array!26069)

(declare-datatypes ((tuple2!7360 0))(
  ( (tuple2!7361 (_1!3691 (_ BitVec 64)) (_2!3691 V!15931)) )
))
(declare-datatypes ((List!7362 0))(
  ( (Nil!7359) (Cons!7358 (h!8214 tuple2!7360) (t!12797 List!7362)) )
))
(declare-datatypes ((ListLongMap!6263 0))(
  ( (ListLongMap!6264 (toList!3147 List!7362)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1355 (array!26069 array!26067 (_ BitVec 32) (_ BitVec 32) V!15931 V!15931 (_ BitVec 32) Int) ListLongMap!6263)

(declare-fun +!1327 (ListLongMap!6263 tuple2!7360) ListLongMap!6263)

(assert (=> b!426357 (= (getCurrentListMapNoExtraKeys!1355 lt!194787 lt!194786 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1327 (getCurrentListMapNoExtraKeys!1355 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7361 k0!794 v!412)))))

(declare-datatypes ((Unit!12500 0))(
  ( (Unit!12501) )
))
(declare-fun lt!194788 () Unit!12500)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!498 (array!26069 array!26067 (_ BitVec 32) (_ BitVec 32) V!15931 V!15931 (_ BitVec 32) (_ BitVec 64) V!15931 (_ BitVec 32) Int) Unit!12500)

(assert (=> b!426357 (= lt!194788 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!498 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426358 () Bool)

(declare-fun res!249926 () Bool)

(assert (=> b!426358 (=> (not res!249926) (not e!252910))))

(assert (=> b!426358 (= res!249926 (or (= (select (arr!12484 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12484 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426359 () Bool)

(declare-fun res!249918 () Bool)

(assert (=> b!426359 (=> (not res!249918) (not e!252910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426359 (= res!249918 (validMask!0 mask!1025))))

(declare-fun b!426360 () Bool)

(declare-fun res!249922 () Bool)

(assert (=> b!426360 (=> (not res!249922) (not e!252910))))

(declare-datatypes ((List!7363 0))(
  ( (Nil!7360) (Cons!7359 (h!8215 (_ BitVec 64)) (t!12798 List!7363)) )
))
(declare-fun arrayNoDuplicates!0 (array!26069 (_ BitVec 32) List!7363) Bool)

(assert (=> b!426360 (= res!249922 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7360))))

(declare-fun b!426361 () Bool)

(declare-fun e!252909 () Bool)

(declare-fun tp_is_empty!11119 () Bool)

(assert (=> b!426361 (= e!252909 tp_is_empty!11119)))

(declare-fun b!426362 () Bool)

(declare-fun e!252907 () Bool)

(assert (=> b!426362 (= e!252907 e!252912)))

(declare-fun res!249923 () Bool)

(assert (=> b!426362 (=> (not res!249923) (not e!252912))))

(assert (=> b!426362 (= res!249923 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194789 () ListLongMap!6263)

(assert (=> b!426362 (= lt!194789 (getCurrentListMapNoExtraKeys!1355 lt!194787 lt!194786 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!426362 (= lt!194786 (array!26068 (store (arr!12483 _values!549) i!563 (ValueCellFull!5216 v!412)) (size!12836 _values!549)))))

(declare-fun lt!194785 () ListLongMap!6263)

(assert (=> b!426362 (= lt!194785 (getCurrentListMapNoExtraKeys!1355 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426352 () Bool)

(declare-fun e!252906 () Bool)

(assert (=> b!426352 (= e!252906 (and e!252909 mapRes!18300))))

(declare-fun condMapEmpty!18300 () Bool)

(declare-fun mapDefault!18300 () ValueCell!5216)

(assert (=> b!426352 (= condMapEmpty!18300 (= (arr!12483 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5216)) mapDefault!18300)))))

(declare-fun res!249930 () Bool)

(assert (=> start!39686 (=> (not res!249930) (not e!252910))))

(assert (=> start!39686 (= res!249930 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12837 _keys!709))))))

(assert (=> start!39686 e!252910))

(assert (=> start!39686 tp_is_empty!11119))

(assert (=> start!39686 tp!35430))

(assert (=> start!39686 true))

(declare-fun array_inv!9124 (array!26067) Bool)

(assert (=> start!39686 (and (array_inv!9124 _values!549) e!252906)))

(declare-fun array_inv!9125 (array!26069) Bool)

(assert (=> start!39686 (array_inv!9125 _keys!709)))

(declare-fun mapIsEmpty!18300 () Bool)

(assert (=> mapIsEmpty!18300 mapRes!18300))

(declare-fun b!426363 () Bool)

(declare-fun res!249925 () Bool)

(assert (=> b!426363 (=> (not res!249925) (not e!252907))))

(assert (=> b!426363 (= res!249925 (bvsle from!863 i!563))))

(declare-fun b!426364 () Bool)

(assert (=> b!426364 (= e!252910 e!252907)))

(declare-fun res!249928 () Bool)

(assert (=> b!426364 (=> (not res!249928) (not e!252907))))

(assert (=> b!426364 (= res!249928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194787 mask!1025))))

(assert (=> b!426364 (= lt!194787 (array!26070 (store (arr!12484 _keys!709) i!563 k0!794) (size!12837 _keys!709)))))

(declare-fun b!426365 () Bool)

(declare-fun res!249921 () Bool)

(assert (=> b!426365 (=> (not res!249921) (not e!252907))))

(assert (=> b!426365 (= res!249921 (arrayNoDuplicates!0 lt!194787 #b00000000000000000000000000000000 Nil!7360))))

(declare-fun b!426366 () Bool)

(declare-fun res!249919 () Bool)

(assert (=> b!426366 (=> (not res!249919) (not e!252910))))

(assert (=> b!426366 (= res!249919 (and (= (size!12836 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12837 _keys!709) (size!12836 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426367 () Bool)

(assert (=> b!426367 (= e!252911 tp_is_empty!11119)))

(assert (= (and start!39686 res!249930) b!426359))

(assert (= (and b!426359 res!249918) b!426366))

(assert (= (and b!426366 res!249919) b!426353))

(assert (= (and b!426353 res!249929) b!426360))

(assert (= (and b!426360 res!249922) b!426355))

(assert (= (and b!426355 res!249920) b!426356))

(assert (= (and b!426356 res!249927) b!426358))

(assert (= (and b!426358 res!249926) b!426354))

(assert (= (and b!426354 res!249924) b!426364))

(assert (= (and b!426364 res!249928) b!426365))

(assert (= (and b!426365 res!249921) b!426363))

(assert (= (and b!426363 res!249925) b!426362))

(assert (= (and b!426362 res!249923) b!426357))

(assert (= (and b!426352 condMapEmpty!18300) mapIsEmpty!18300))

(assert (= (and b!426352 (not condMapEmpty!18300)) mapNonEmpty!18300))

(get-info :version)

(assert (= (and mapNonEmpty!18300 ((_ is ValueCellFull!5216) mapValue!18300)) b!426367))

(assert (= (and b!426352 ((_ is ValueCellFull!5216) mapDefault!18300)) b!426361))

(assert (= start!39686 b!426352))

(declare-fun m!414543 () Bool)

(assert (=> b!426360 m!414543))

(declare-fun m!414545 () Bool)

(assert (=> b!426359 m!414545))

(declare-fun m!414547 () Bool)

(assert (=> b!426364 m!414547))

(declare-fun m!414549 () Bool)

(assert (=> b!426364 m!414549))

(declare-fun m!414551 () Bool)

(assert (=> b!426353 m!414551))

(declare-fun m!414553 () Bool)

(assert (=> b!426354 m!414553))

(declare-fun m!414555 () Bool)

(assert (=> b!426362 m!414555))

(declare-fun m!414557 () Bool)

(assert (=> b!426362 m!414557))

(declare-fun m!414559 () Bool)

(assert (=> b!426362 m!414559))

(declare-fun m!414561 () Bool)

(assert (=> b!426357 m!414561))

(declare-fun m!414563 () Bool)

(assert (=> b!426357 m!414563))

(assert (=> b!426357 m!414563))

(declare-fun m!414565 () Bool)

(assert (=> b!426357 m!414565))

(declare-fun m!414567 () Bool)

(assert (=> b!426357 m!414567))

(declare-fun m!414569 () Bool)

(assert (=> start!39686 m!414569))

(declare-fun m!414571 () Bool)

(assert (=> start!39686 m!414571))

(declare-fun m!414573 () Bool)

(assert (=> mapNonEmpty!18300 m!414573))

(declare-fun m!414575 () Bool)

(assert (=> b!426358 m!414575))

(declare-fun m!414577 () Bool)

(assert (=> b!426356 m!414577))

(declare-fun m!414579 () Bool)

(assert (=> b!426365 m!414579))

(check-sat tp_is_empty!11119 (not b!426357) (not start!39686) (not b!426356) (not b!426359) (not b!426364) (not mapNonEmpty!18300) (not b!426360) (not b!426354) (not b!426353) b_and!17597 (not b!426362) (not b_next!9967) (not b!426365))
(check-sat b_and!17597 (not b_next!9967))
