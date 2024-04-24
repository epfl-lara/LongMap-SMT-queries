; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40686 () Bool)

(assert start!40686)

(declare-fun b_free!10711 () Bool)

(declare-fun b_next!10711 () Bool)

(assert (=> start!40686 (= b_free!10711 (not b_next!10711))))

(declare-fun tp!37952 () Bool)

(declare-fun b_and!18733 () Bool)

(assert (=> start!40686 (= tp!37952 b_and!18733)))

(declare-fun b!450180 () Bool)

(declare-fun res!267936 () Bool)

(declare-fun e!263828 () Bool)

(assert (=> b!450180 (=> (not res!267936) (not e!263828))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450180 (= res!267936 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19707 () Bool)

(declare-fun mapRes!19707 () Bool)

(declare-fun tp!37953 () Bool)

(declare-fun e!263834 () Bool)

(assert (=> mapNonEmpty!19707 (= mapRes!19707 (and tp!37953 e!263834))))

(declare-datatypes ((V!17171 0))(
  ( (V!17172 (val!6069 Int)) )
))
(declare-datatypes ((ValueCell!5681 0))(
  ( (ValueCellFull!5681 (v!8325 V!17171)) (EmptyCell!5681) )
))
(declare-fun mapRest!19707 () (Array (_ BitVec 32) ValueCell!5681))

(declare-datatypes ((array!27898 0))(
  ( (array!27899 (arr!13394 (Array (_ BitVec 32) ValueCell!5681)) (size!13746 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27898)

(declare-fun mapValue!19707 () ValueCell!5681)

(declare-fun mapKey!19707 () (_ BitVec 32))

(assert (=> mapNonEmpty!19707 (= (arr!13394 _values!549) (store mapRest!19707 mapKey!19707 mapValue!19707))))

(declare-fun b!450181 () Bool)

(declare-fun res!267947 () Bool)

(assert (=> b!450181 (=> (not res!267947) (not e!263828))))

(declare-datatypes ((array!27900 0))(
  ( (array!27901 (arr!13395 (Array (_ BitVec 32) (_ BitVec 64))) (size!13747 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27900)

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!450181 (= res!267947 (and (= (size!13746 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13747 _keys!709) (size!13746 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450182 () Bool)

(declare-fun res!267948 () Bool)

(assert (=> b!450182 (=> (not res!267948) (not e!263828))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450182 (= res!267948 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13747 _keys!709))))))

(declare-fun b!450183 () Bool)

(declare-fun e!263827 () Bool)

(declare-fun e!263829 () Bool)

(assert (=> b!450183 (= e!263827 e!263829)))

(declare-fun res!267943 () Bool)

(assert (=> b!450183 (=> (not res!267943) (not e!263829))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!450183 (= res!267943 (= from!863 i!563))))

(declare-fun minValue!515 () V!17171)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!204570 () array!27898)

(declare-fun zeroValue!515 () V!17171)

(declare-fun lt!204571 () array!27900)

(declare-datatypes ((tuple2!7876 0))(
  ( (tuple2!7877 (_1!3949 (_ BitVec 64)) (_2!3949 V!17171)) )
))
(declare-datatypes ((List!7947 0))(
  ( (Nil!7944) (Cons!7943 (h!8799 tuple2!7876) (t!13701 List!7947)) )
))
(declare-datatypes ((ListLongMap!6791 0))(
  ( (ListLongMap!6792 (toList!3411 List!7947)) )
))
(declare-fun lt!204574 () ListLongMap!6791)

(declare-fun getCurrentListMapNoExtraKeys!1641 (array!27900 array!27898 (_ BitVec 32) (_ BitVec 32) V!17171 V!17171 (_ BitVec 32) Int) ListLongMap!6791)

(assert (=> b!450183 (= lt!204574 (getCurrentListMapNoExtraKeys!1641 lt!204571 lt!204570 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17171)

(assert (=> b!450183 (= lt!204570 (array!27899 (store (arr!13394 _values!549) i!563 (ValueCellFull!5681 v!412)) (size!13746 _values!549)))))

(declare-fun lt!204573 () ListLongMap!6791)

(assert (=> b!450183 (= lt!204573 (getCurrentListMapNoExtraKeys!1641 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450184 () Bool)

(assert (=> b!450184 (= e!263828 e!263827)))

(declare-fun res!267944 () Bool)

(assert (=> b!450184 (=> (not res!267944) (not e!263827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27900 (_ BitVec 32)) Bool)

(assert (=> b!450184 (= res!267944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204571 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!450184 (= lt!204571 (array!27901 (store (arr!13395 _keys!709) i!563 k0!794) (size!13747 _keys!709)))))

(declare-fun b!450185 () Bool)

(declare-fun res!267940 () Bool)

(assert (=> b!450185 (=> (not res!267940) (not e!263827))))

(declare-datatypes ((List!7948 0))(
  ( (Nil!7945) (Cons!7944 (h!8800 (_ BitVec 64)) (t!13702 List!7948)) )
))
(declare-fun arrayNoDuplicates!0 (array!27900 (_ BitVec 32) List!7948) Bool)

(assert (=> b!450185 (= res!267940 (arrayNoDuplicates!0 lt!204571 #b00000000000000000000000000000000 Nil!7945))))

(declare-fun call!29713 () ListLongMap!6791)

(declare-fun bm!29709 () Bool)

(declare-fun c!55950 () Bool)

(assert (=> bm!29709 (= call!29713 (getCurrentListMapNoExtraKeys!1641 (ite c!55950 lt!204571 _keys!709) (ite c!55950 lt!204570 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29712 () ListLongMap!6791)

(declare-fun bm!29710 () Bool)

(assert (=> bm!29710 (= call!29712 (getCurrentListMapNoExtraKeys!1641 (ite c!55950 _keys!709 lt!204571) (ite c!55950 _values!549 lt!204570) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450186 () Bool)

(declare-fun res!267946 () Bool)

(assert (=> b!450186 (=> (not res!267946) (not e!263828))))

(assert (=> b!450186 (= res!267946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450187 () Bool)

(declare-fun tp_is_empty!12049 () Bool)

(assert (=> b!450187 (= e!263834 tp_is_empty!12049)))

(declare-fun e!263832 () Bool)

(declare-fun b!450188 () Bool)

(declare-fun +!1540 (ListLongMap!6791 tuple2!7876) ListLongMap!6791)

(assert (=> b!450188 (= e!263832 (= call!29713 (+!1540 call!29712 (tuple2!7877 k0!794 v!412))))))

(declare-fun b!450189 () Bool)

(declare-fun res!267935 () Bool)

(assert (=> b!450189 (=> (not res!267935) (not e!263828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450189 (= res!267935 (validKeyInArray!0 k0!794))))

(declare-fun b!450190 () Bool)

(declare-fun res!267942 () Bool)

(assert (=> b!450190 (=> (not res!267942) (not e!263828))))

(assert (=> b!450190 (= res!267942 (or (= (select (arr!13395 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13395 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450191 () Bool)

(declare-fun e!263835 () Bool)

(assert (=> b!450191 (= e!263835 tp_is_empty!12049)))

(declare-fun b!450192 () Bool)

(assert (=> b!450192 (= e!263832 (= call!29712 call!29713))))

(declare-fun b!450193 () Bool)

(declare-fun res!267945 () Bool)

(assert (=> b!450193 (=> (not res!267945) (not e!263827))))

(assert (=> b!450193 (= res!267945 (bvsle from!863 i!563))))

(declare-fun b!450194 () Bool)

(declare-fun e!263833 () Bool)

(assert (=> b!450194 (= e!263833 (and e!263835 mapRes!19707))))

(declare-fun condMapEmpty!19707 () Bool)

(declare-fun mapDefault!19707 () ValueCell!5681)

(assert (=> b!450194 (= condMapEmpty!19707 (= (arr!13394 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5681)) mapDefault!19707)))))

(declare-fun mapIsEmpty!19707 () Bool)

(assert (=> mapIsEmpty!19707 mapRes!19707))

(declare-fun res!267941 () Bool)

(assert (=> start!40686 (=> (not res!267941) (not e!263828))))

(assert (=> start!40686 (= res!267941 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13747 _keys!709))))))

(assert (=> start!40686 e!263828))

(assert (=> start!40686 tp_is_empty!12049))

(assert (=> start!40686 tp!37952))

(assert (=> start!40686 true))

(declare-fun array_inv!9782 (array!27898) Bool)

(assert (=> start!40686 (and (array_inv!9782 _values!549) e!263833)))

(declare-fun array_inv!9783 (array!27900) Bool)

(assert (=> start!40686 (array_inv!9783 _keys!709)))

(declare-fun b!450195 () Bool)

(declare-fun e!263830 () Bool)

(assert (=> b!450195 (= e!263829 (not e!263830))))

(declare-fun res!267939 () Bool)

(assert (=> b!450195 (=> res!267939 e!263830)))

(assert (=> b!450195 (= res!267939 (validKeyInArray!0 (select (arr!13395 _keys!709) from!863)))))

(assert (=> b!450195 e!263832))

(assert (=> b!450195 (= c!55950 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13165 0))(
  ( (Unit!13166) )
))
(declare-fun lt!204572 () Unit!13165)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!703 (array!27900 array!27898 (_ BitVec 32) (_ BitVec 32) V!17171 V!17171 (_ BitVec 32) (_ BitVec 64) V!17171 (_ BitVec 32) Int) Unit!13165)

(assert (=> b!450195 (= lt!204572 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!703 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450196 () Bool)

(assert (=> b!450196 (= e!263830 (bvslt i!563 (size!13746 _values!549)))))

(declare-fun b!450197 () Bool)

(declare-fun res!267938 () Bool)

(assert (=> b!450197 (=> (not res!267938) (not e!263828))))

(declare-fun arrayContainsKey!0 (array!27900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450197 (= res!267938 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450198 () Bool)

(declare-fun res!267937 () Bool)

(assert (=> b!450198 (=> (not res!267937) (not e!263828))))

(assert (=> b!450198 (= res!267937 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7945))))

(assert (= (and start!40686 res!267941) b!450180))

(assert (= (and b!450180 res!267936) b!450181))

(assert (= (and b!450181 res!267947) b!450186))

(assert (= (and b!450186 res!267946) b!450198))

(assert (= (and b!450198 res!267937) b!450182))

(assert (= (and b!450182 res!267948) b!450189))

(assert (= (and b!450189 res!267935) b!450190))

(assert (= (and b!450190 res!267942) b!450197))

(assert (= (and b!450197 res!267938) b!450184))

(assert (= (and b!450184 res!267944) b!450185))

(assert (= (and b!450185 res!267940) b!450193))

(assert (= (and b!450193 res!267945) b!450183))

(assert (= (and b!450183 res!267943) b!450195))

(assert (= (and b!450195 c!55950) b!450188))

(assert (= (and b!450195 (not c!55950)) b!450192))

(assert (= (or b!450188 b!450192) bm!29709))

(assert (= (or b!450188 b!450192) bm!29710))

(assert (= (and b!450195 (not res!267939)) b!450196))

(assert (= (and b!450194 condMapEmpty!19707) mapIsEmpty!19707))

(assert (= (and b!450194 (not condMapEmpty!19707)) mapNonEmpty!19707))

(get-info :version)

(assert (= (and mapNonEmpty!19707 ((_ is ValueCellFull!5681) mapValue!19707)) b!450187))

(assert (= (and b!450194 ((_ is ValueCellFull!5681) mapDefault!19707)) b!450191))

(assert (= start!40686 b!450194))

(declare-fun m!434409 () Bool)

(assert (=> start!40686 m!434409))

(declare-fun m!434411 () Bool)

(assert (=> start!40686 m!434411))

(declare-fun m!434413 () Bool)

(assert (=> b!450195 m!434413))

(assert (=> b!450195 m!434413))

(declare-fun m!434415 () Bool)

(assert (=> b!450195 m!434415))

(declare-fun m!434417 () Bool)

(assert (=> b!450195 m!434417))

(declare-fun m!434419 () Bool)

(assert (=> b!450190 m!434419))

(declare-fun m!434421 () Bool)

(assert (=> b!450186 m!434421))

(declare-fun m!434423 () Bool)

(assert (=> b!450180 m!434423))

(declare-fun m!434425 () Bool)

(assert (=> b!450184 m!434425))

(declare-fun m!434427 () Bool)

(assert (=> b!450184 m!434427))

(declare-fun m!434429 () Bool)

(assert (=> mapNonEmpty!19707 m!434429))

(declare-fun m!434431 () Bool)

(assert (=> bm!29710 m!434431))

(declare-fun m!434433 () Bool)

(assert (=> b!450197 m!434433))

(declare-fun m!434435 () Bool)

(assert (=> b!450183 m!434435))

(declare-fun m!434437 () Bool)

(assert (=> b!450183 m!434437))

(declare-fun m!434439 () Bool)

(assert (=> b!450183 m!434439))

(declare-fun m!434441 () Bool)

(assert (=> b!450198 m!434441))

(declare-fun m!434443 () Bool)

(assert (=> b!450189 m!434443))

(declare-fun m!434445 () Bool)

(assert (=> b!450185 m!434445))

(declare-fun m!434447 () Bool)

(assert (=> b!450188 m!434447))

(declare-fun m!434449 () Bool)

(assert (=> bm!29709 m!434449))

(check-sat (not b!450180) (not b!450183) (not b!450188) (not b!450186) (not b!450184) (not b!450198) (not b_next!10711) (not start!40686) (not b!450189) (not mapNonEmpty!19707) (not b!450197) (not bm!29710) (not bm!29709) b_and!18733 (not b!450195) (not b!450185) tp_is_empty!12049)
(check-sat b_and!18733 (not b_next!10711))
