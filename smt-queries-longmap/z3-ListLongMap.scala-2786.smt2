; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40590 () Bool)

(assert start!40590)

(declare-fun b_free!10615 () Bool)

(declare-fun b_next!10615 () Bool)

(assert (=> start!40590 (= b_free!10615 (not b_next!10615))))

(declare-fun tp!37665 () Bool)

(declare-fun b_and!18637 () Bool)

(assert (=> start!40590 (= tp!37665 b_and!18637)))

(declare-fun b!447958 () Bool)

(declare-fun res!266192 () Bool)

(declare-fun e!262924 () Bool)

(assert (=> b!447958 (=> (not res!266192) (not e!262924))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17043 0))(
  ( (V!17044 (val!6021 Int)) )
))
(declare-datatypes ((ValueCell!5633 0))(
  ( (ValueCellFull!5633 (v!8277 V!17043)) (EmptyCell!5633) )
))
(declare-datatypes ((array!27714 0))(
  ( (array!27715 (arr!13302 (Array (_ BitVec 32) ValueCell!5633)) (size!13654 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27714)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!27716 0))(
  ( (array!27717 (arr!13303 (Array (_ BitVec 32) (_ BitVec 64))) (size!13655 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27716)

(assert (=> b!447958 (= res!266192 (and (= (size!13654 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13655 _keys!709) (size!13654 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!447959 () Bool)

(declare-fun e!262921 () Bool)

(assert (=> b!447959 (= e!262924 e!262921)))

(declare-fun res!266188 () Bool)

(assert (=> b!447959 (=> (not res!266188) (not e!262921))))

(declare-fun lt!204099 () array!27716)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27716 (_ BitVec 32)) Bool)

(assert (=> b!447959 (= res!266188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204099 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447959 (= lt!204099 (array!27717 (store (arr!13303 _keys!709) i!563 k0!794) (size!13655 _keys!709)))))

(declare-fun mapIsEmpty!19563 () Bool)

(declare-fun mapRes!19563 () Bool)

(assert (=> mapIsEmpty!19563 mapRes!19563))

(declare-fun mapNonEmpty!19563 () Bool)

(declare-fun tp!37664 () Bool)

(declare-fun e!262923 () Bool)

(assert (=> mapNonEmpty!19563 (= mapRes!19563 (and tp!37664 e!262923))))

(declare-fun mapRest!19563 () (Array (_ BitVec 32) ValueCell!5633))

(declare-fun mapKey!19563 () (_ BitVec 32))

(declare-fun mapValue!19563 () ValueCell!5633)

(assert (=> mapNonEmpty!19563 (= (arr!13302 _values!549) (store mapRest!19563 mapKey!19563 mapValue!19563))))

(declare-fun b!447960 () Bool)

(declare-fun res!266190 () Bool)

(assert (=> b!447960 (=> (not res!266190) (not e!262924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447960 (= res!266190 (validKeyInArray!0 k0!794))))

(declare-fun b!447961 () Bool)

(declare-fun res!266189 () Bool)

(assert (=> b!447961 (=> (not res!266189) (not e!262921))))

(declare-datatypes ((List!7877 0))(
  ( (Nil!7874) (Cons!7873 (h!8729 (_ BitVec 64)) (t!13631 List!7877)) )
))
(declare-fun arrayNoDuplicates!0 (array!27716 (_ BitVec 32) List!7877) Bool)

(assert (=> b!447961 (= res!266189 (arrayNoDuplicates!0 lt!204099 #b00000000000000000000000000000000 Nil!7874))))

(declare-fun b!447962 () Bool)

(declare-fun res!266185 () Bool)

(assert (=> b!447962 (=> (not res!266185) (not e!262924))))

(assert (=> b!447962 (= res!266185 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13655 _keys!709))))))

(declare-fun res!266194 () Bool)

(assert (=> start!40590 (=> (not res!266194) (not e!262924))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40590 (= res!266194 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13655 _keys!709))))))

(assert (=> start!40590 e!262924))

(declare-fun tp_is_empty!11953 () Bool)

(assert (=> start!40590 tp_is_empty!11953))

(assert (=> start!40590 tp!37665))

(assert (=> start!40590 true))

(declare-fun e!262922 () Bool)

(declare-fun array_inv!9720 (array!27714) Bool)

(assert (=> start!40590 (and (array_inv!9720 _values!549) e!262922)))

(declare-fun array_inv!9721 (array!27716) Bool)

(assert (=> start!40590 (array_inv!9721 _keys!709)))

(declare-fun b!447963 () Bool)

(declare-fun res!266191 () Bool)

(assert (=> b!447963 (=> (not res!266191) (not e!262924))))

(assert (=> b!447963 (= res!266191 (or (= (select (arr!13303 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13303 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447964 () Bool)

(assert (=> b!447964 (= e!262923 tp_is_empty!11953)))

(declare-fun b!447965 () Bool)

(declare-fun e!262926 () Bool)

(assert (=> b!447965 (= e!262922 (and e!262926 mapRes!19563))))

(declare-fun condMapEmpty!19563 () Bool)

(declare-fun mapDefault!19563 () ValueCell!5633)

(assert (=> b!447965 (= condMapEmpty!19563 (= (arr!13302 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5633)) mapDefault!19563)))))

(declare-fun b!447966 () Bool)

(assert (=> b!447966 (= e!262921 false)))

(declare-fun minValue!515 () V!17043)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17043)

(declare-datatypes ((tuple2!7806 0))(
  ( (tuple2!7807 (_1!3914 (_ BitVec 64)) (_2!3914 V!17043)) )
))
(declare-datatypes ((List!7878 0))(
  ( (Nil!7875) (Cons!7874 (h!8730 tuple2!7806) (t!13632 List!7878)) )
))
(declare-datatypes ((ListLongMap!6721 0))(
  ( (ListLongMap!6722 (toList!3376 List!7878)) )
))
(declare-fun lt!204098 () ListLongMap!6721)

(declare-fun v!412 () V!17043)

(declare-fun getCurrentListMapNoExtraKeys!1606 (array!27716 array!27714 (_ BitVec 32) (_ BitVec 32) V!17043 V!17043 (_ BitVec 32) Int) ListLongMap!6721)

(assert (=> b!447966 (= lt!204098 (getCurrentListMapNoExtraKeys!1606 lt!204099 (array!27715 (store (arr!13302 _values!549) i!563 (ValueCellFull!5633 v!412)) (size!13654 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204100 () ListLongMap!6721)

(assert (=> b!447966 (= lt!204100 (getCurrentListMapNoExtraKeys!1606 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447967 () Bool)

(declare-fun res!266193 () Bool)

(assert (=> b!447967 (=> (not res!266193) (not e!262924))))

(declare-fun arrayContainsKey!0 (array!27716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447967 (= res!266193 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447968 () Bool)

(declare-fun res!266186 () Bool)

(assert (=> b!447968 (=> (not res!266186) (not e!262924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447968 (= res!266186 (validMask!0 mask!1025))))

(declare-fun b!447969 () Bool)

(declare-fun res!266195 () Bool)

(assert (=> b!447969 (=> (not res!266195) (not e!262924))))

(assert (=> b!447969 (= res!266195 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7874))))

(declare-fun b!447970 () Bool)

(declare-fun res!266196 () Bool)

(assert (=> b!447970 (=> (not res!266196) (not e!262921))))

(assert (=> b!447970 (= res!266196 (bvsle from!863 i!563))))

(declare-fun b!447971 () Bool)

(declare-fun res!266187 () Bool)

(assert (=> b!447971 (=> (not res!266187) (not e!262924))))

(assert (=> b!447971 (= res!266187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!447972 () Bool)

(assert (=> b!447972 (= e!262926 tp_is_empty!11953)))

(assert (= (and start!40590 res!266194) b!447968))

(assert (= (and b!447968 res!266186) b!447958))

(assert (= (and b!447958 res!266192) b!447971))

(assert (= (and b!447971 res!266187) b!447969))

(assert (= (and b!447969 res!266195) b!447962))

(assert (= (and b!447962 res!266185) b!447960))

(assert (= (and b!447960 res!266190) b!447963))

(assert (= (and b!447963 res!266191) b!447967))

(assert (= (and b!447967 res!266193) b!447959))

(assert (= (and b!447959 res!266188) b!447961))

(assert (= (and b!447961 res!266189) b!447970))

(assert (= (and b!447970 res!266196) b!447966))

(assert (= (and b!447965 condMapEmpty!19563) mapIsEmpty!19563))

(assert (= (and b!447965 (not condMapEmpty!19563)) mapNonEmpty!19563))

(get-info :version)

(assert (= (and mapNonEmpty!19563 ((_ is ValueCellFull!5633) mapValue!19563)) b!447964))

(assert (= (and b!447965 ((_ is ValueCellFull!5633) mapDefault!19563)) b!447972))

(assert (= start!40590 b!447965))

(declare-fun m!432921 () Bool)

(assert (=> b!447969 m!432921))

(declare-fun m!432923 () Bool)

(assert (=> b!447971 m!432923))

(declare-fun m!432925 () Bool)

(assert (=> b!447961 m!432925))

(declare-fun m!432927 () Bool)

(assert (=> b!447966 m!432927))

(declare-fun m!432929 () Bool)

(assert (=> b!447966 m!432929))

(declare-fun m!432931 () Bool)

(assert (=> b!447966 m!432931))

(declare-fun m!432933 () Bool)

(assert (=> b!447967 m!432933))

(declare-fun m!432935 () Bool)

(assert (=> b!447959 m!432935))

(declare-fun m!432937 () Bool)

(assert (=> b!447959 m!432937))

(declare-fun m!432939 () Bool)

(assert (=> start!40590 m!432939))

(declare-fun m!432941 () Bool)

(assert (=> start!40590 m!432941))

(declare-fun m!432943 () Bool)

(assert (=> b!447963 m!432943))

(declare-fun m!432945 () Bool)

(assert (=> b!447968 m!432945))

(declare-fun m!432947 () Bool)

(assert (=> mapNonEmpty!19563 m!432947))

(declare-fun m!432949 () Bool)

(assert (=> b!447960 m!432949))

(check-sat (not b!447969) (not start!40590) (not b!447966) (not b!447968) b_and!18637 (not b!447971) (not b!447961) (not b_next!10615) (not b!447967) tp_is_empty!11953 (not b!447960) (not mapNonEmpty!19563) (not b!447959))
(check-sat b_and!18637 (not b_next!10615))
