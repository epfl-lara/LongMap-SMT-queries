; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39636 () Bool)

(assert start!39636)

(declare-fun b_free!9903 () Bool)

(declare-fun b_next!9903 () Bool)

(assert (=> start!39636 (= b_free!9903 (not b_next!9903))))

(declare-fun tp!35238 () Bool)

(declare-fun b_and!17559 () Bool)

(assert (=> start!39636 (= tp!35238 b_and!17559)))

(declare-fun b!425087 () Bool)

(declare-fun e!252413 () Bool)

(declare-fun e!252411 () Bool)

(assert (=> b!425087 (= e!252413 e!252411)))

(declare-fun res!248806 () Bool)

(assert (=> b!425087 (=> (not res!248806) (not e!252411))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425087 (= res!248806 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15845 0))(
  ( (V!15846 (val!5572 Int)) )
))
(declare-datatypes ((tuple2!7318 0))(
  ( (tuple2!7319 (_1!3670 (_ BitVec 64)) (_2!3670 V!15845)) )
))
(declare-datatypes ((List!7329 0))(
  ( (Nil!7326) (Cons!7325 (h!8181 tuple2!7318) (t!12773 List!7329)) )
))
(declare-datatypes ((ListLongMap!6231 0))(
  ( (ListLongMap!6232 (toList!3131 List!7329)) )
))
(declare-fun lt!194541 () ListLongMap!6231)

(declare-fun minValue!515 () V!15845)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15845)

(declare-datatypes ((array!25949 0))(
  ( (array!25950 (arr!12424 (Array (_ BitVec 32) (_ BitVec 64))) (size!12776 (_ BitVec 32))) )
))
(declare-fun lt!194543 () array!25949)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5184 0))(
  ( (ValueCellFull!5184 (v!7819 V!15845)) (EmptyCell!5184) )
))
(declare-datatypes ((array!25951 0))(
  ( (array!25952 (arr!12425 (Array (_ BitVec 32) ValueCell!5184)) (size!12777 (_ BitVec 32))) )
))
(declare-fun lt!194542 () array!25951)

(declare-fun getCurrentListMapNoExtraKeys!1335 (array!25949 array!25951 (_ BitVec 32) (_ BitVec 32) V!15845 V!15845 (_ BitVec 32) Int) ListLongMap!6231)

(assert (=> b!425087 (= lt!194541 (getCurrentListMapNoExtraKeys!1335 lt!194543 lt!194542 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25951)

(declare-fun v!412 () V!15845)

(assert (=> b!425087 (= lt!194542 (array!25952 (store (arr!12425 _values!549) i!563 (ValueCellFull!5184 v!412)) (size!12777 _values!549)))))

(declare-fun _keys!709 () array!25949)

(declare-fun lt!194539 () ListLongMap!6231)

(assert (=> b!425087 (= lt!194539 (getCurrentListMapNoExtraKeys!1335 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425088 () Bool)

(assert (=> b!425088 (= e!252411 (not true))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1289 (ListLongMap!6231 tuple2!7318) ListLongMap!6231)

(assert (=> b!425088 (= (getCurrentListMapNoExtraKeys!1335 lt!194543 lt!194542 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1289 (getCurrentListMapNoExtraKeys!1335 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7319 k0!794 v!412)))))

(declare-datatypes ((Unit!12480 0))(
  ( (Unit!12481) )
))
(declare-fun lt!194540 () Unit!12480)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!484 (array!25949 array!25951 (_ BitVec 32) (_ BitVec 32) V!15845 V!15845 (_ BitVec 32) (_ BitVec 64) V!15845 (_ BitVec 32) Int) Unit!12480)

(assert (=> b!425088 (= lt!194540 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!484 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425089 () Bool)

(declare-fun res!248799 () Bool)

(assert (=> b!425089 (=> (not res!248799) (not e!252413))))

(assert (=> b!425089 (= res!248799 (bvsle from!863 i!563))))

(declare-fun b!425090 () Bool)

(declare-fun e!252414 () Bool)

(declare-fun tp_is_empty!11055 () Bool)

(assert (=> b!425090 (= e!252414 tp_is_empty!11055)))

(declare-fun b!425091 () Bool)

(declare-fun res!248807 () Bool)

(declare-fun e!252410 () Bool)

(assert (=> b!425091 (=> (not res!248807) (not e!252410))))

(assert (=> b!425091 (= res!248807 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12776 _keys!709))))))

(declare-fun b!425092 () Bool)

(assert (=> b!425092 (= e!252410 e!252413)))

(declare-fun res!248803 () Bool)

(assert (=> b!425092 (=> (not res!248803) (not e!252413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25949 (_ BitVec 32)) Bool)

(assert (=> b!425092 (= res!248803 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194543 mask!1025))))

(assert (=> b!425092 (= lt!194543 (array!25950 (store (arr!12424 _keys!709) i!563 k0!794) (size!12776 _keys!709)))))

(declare-fun mapIsEmpty!18204 () Bool)

(declare-fun mapRes!18204 () Bool)

(assert (=> mapIsEmpty!18204 mapRes!18204))

(declare-fun b!425093 () Bool)

(declare-fun e!252408 () Bool)

(assert (=> b!425093 (= e!252408 (and e!252414 mapRes!18204))))

(declare-fun condMapEmpty!18204 () Bool)

(declare-fun mapDefault!18204 () ValueCell!5184)

(assert (=> b!425093 (= condMapEmpty!18204 (= (arr!12425 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5184)) mapDefault!18204)))))

(declare-fun b!425094 () Bool)

(declare-fun res!248808 () Bool)

(assert (=> b!425094 (=> (not res!248808) (not e!252410))))

(assert (=> b!425094 (= res!248808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425095 () Bool)

(declare-fun res!248802 () Bool)

(assert (=> b!425095 (=> (not res!248802) (not e!252410))))

(declare-fun arrayContainsKey!0 (array!25949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425095 (= res!248802 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425096 () Bool)

(declare-fun res!248804 () Bool)

(assert (=> b!425096 (=> (not res!248804) (not e!252413))))

(declare-datatypes ((List!7330 0))(
  ( (Nil!7327) (Cons!7326 (h!8182 (_ BitVec 64)) (t!12774 List!7330)) )
))
(declare-fun arrayNoDuplicates!0 (array!25949 (_ BitVec 32) List!7330) Bool)

(assert (=> b!425096 (= res!248804 (arrayNoDuplicates!0 lt!194543 #b00000000000000000000000000000000 Nil!7327))))

(declare-fun b!425097 () Bool)

(declare-fun res!248809 () Bool)

(assert (=> b!425097 (=> (not res!248809) (not e!252410))))

(assert (=> b!425097 (= res!248809 (and (= (size!12777 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12776 _keys!709) (size!12777 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425098 () Bool)

(declare-fun res!248800 () Bool)

(assert (=> b!425098 (=> (not res!248800) (not e!252410))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425098 (= res!248800 (validKeyInArray!0 k0!794))))

(declare-fun b!425099 () Bool)

(declare-fun res!248810 () Bool)

(assert (=> b!425099 (=> (not res!248810) (not e!252410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425099 (= res!248810 (validMask!0 mask!1025))))

(declare-fun res!248801 () Bool)

(assert (=> start!39636 (=> (not res!248801) (not e!252410))))

(assert (=> start!39636 (= res!248801 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12776 _keys!709))))))

(assert (=> start!39636 e!252410))

(assert (=> start!39636 tp_is_empty!11055))

(assert (=> start!39636 tp!35238))

(assert (=> start!39636 true))

(declare-fun array_inv!9054 (array!25951) Bool)

(assert (=> start!39636 (and (array_inv!9054 _values!549) e!252408)))

(declare-fun array_inv!9055 (array!25949) Bool)

(assert (=> start!39636 (array_inv!9055 _keys!709)))

(declare-fun b!425100 () Bool)

(declare-fun res!248811 () Bool)

(assert (=> b!425100 (=> (not res!248811) (not e!252410))))

(assert (=> b!425100 (= res!248811 (or (= (select (arr!12424 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12424 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18204 () Bool)

(declare-fun tp!35237 () Bool)

(declare-fun e!252409 () Bool)

(assert (=> mapNonEmpty!18204 (= mapRes!18204 (and tp!35237 e!252409))))

(declare-fun mapRest!18204 () (Array (_ BitVec 32) ValueCell!5184))

(declare-fun mapKey!18204 () (_ BitVec 32))

(declare-fun mapValue!18204 () ValueCell!5184)

(assert (=> mapNonEmpty!18204 (= (arr!12425 _values!549) (store mapRest!18204 mapKey!18204 mapValue!18204))))

(declare-fun b!425101 () Bool)

(declare-fun res!248805 () Bool)

(assert (=> b!425101 (=> (not res!248805) (not e!252410))))

(assert (=> b!425101 (= res!248805 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7327))))

(declare-fun b!425102 () Bool)

(assert (=> b!425102 (= e!252409 tp_is_empty!11055)))

(assert (= (and start!39636 res!248801) b!425099))

(assert (= (and b!425099 res!248810) b!425097))

(assert (= (and b!425097 res!248809) b!425094))

(assert (= (and b!425094 res!248808) b!425101))

(assert (= (and b!425101 res!248805) b!425091))

(assert (= (and b!425091 res!248807) b!425098))

(assert (= (and b!425098 res!248800) b!425100))

(assert (= (and b!425100 res!248811) b!425095))

(assert (= (and b!425095 res!248802) b!425092))

(assert (= (and b!425092 res!248803) b!425096))

(assert (= (and b!425096 res!248804) b!425089))

(assert (= (and b!425089 res!248799) b!425087))

(assert (= (and b!425087 res!248806) b!425088))

(assert (= (and b!425093 condMapEmpty!18204) mapIsEmpty!18204))

(assert (= (and b!425093 (not condMapEmpty!18204)) mapNonEmpty!18204))

(get-info :version)

(assert (= (and mapNonEmpty!18204 ((_ is ValueCellFull!5184) mapValue!18204)) b!425102))

(assert (= (and b!425093 ((_ is ValueCellFull!5184) mapDefault!18204)) b!425090))

(assert (= start!39636 b!425093))

(declare-fun m!414059 () Bool)

(assert (=> b!425087 m!414059))

(declare-fun m!414061 () Bool)

(assert (=> b!425087 m!414061))

(declare-fun m!414063 () Bool)

(assert (=> b!425087 m!414063))

(declare-fun m!414065 () Bool)

(assert (=> b!425096 m!414065))

(declare-fun m!414067 () Bool)

(assert (=> start!39636 m!414067))

(declare-fun m!414069 () Bool)

(assert (=> start!39636 m!414069))

(declare-fun m!414071 () Bool)

(assert (=> mapNonEmpty!18204 m!414071))

(declare-fun m!414073 () Bool)

(assert (=> b!425098 m!414073))

(declare-fun m!414075 () Bool)

(assert (=> b!425099 m!414075))

(declare-fun m!414077 () Bool)

(assert (=> b!425092 m!414077))

(declare-fun m!414079 () Bool)

(assert (=> b!425092 m!414079))

(declare-fun m!414081 () Bool)

(assert (=> b!425094 m!414081))

(declare-fun m!414083 () Bool)

(assert (=> b!425095 m!414083))

(declare-fun m!414085 () Bool)

(assert (=> b!425100 m!414085))

(declare-fun m!414087 () Bool)

(assert (=> b!425101 m!414087))

(declare-fun m!414089 () Bool)

(assert (=> b!425088 m!414089))

(declare-fun m!414091 () Bool)

(assert (=> b!425088 m!414091))

(assert (=> b!425088 m!414091))

(declare-fun m!414093 () Bool)

(assert (=> b!425088 m!414093))

(declare-fun m!414095 () Bool)

(assert (=> b!425088 m!414095))

(check-sat (not b!425098) (not mapNonEmpty!18204) (not b!425095) (not b!425101) (not b!425088) (not b!425096) (not b!425087) tp_is_empty!11055 (not b!425094) b_and!17559 (not b!425099) (not b_next!9903) (not start!39636) (not b!425092))
(check-sat b_and!17559 (not b_next!9903))
