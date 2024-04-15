; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37524 () Bool)

(assert start!37524)

(declare-fun b_free!8665 () Bool)

(declare-fun b_next!8665 () Bool)

(assert (=> start!37524 (= b_free!8665 (not b_next!8665))))

(declare-fun tp!30710 () Bool)

(declare-fun b_and!15881 () Bool)

(assert (=> start!37524 (= tp!30710 b_and!15881)))

(declare-fun b!382971 () Bool)

(declare-fun res!218031 () Bool)

(declare-fun e!232633 () Bool)

(assert (=> b!382971 (=> (not res!218031) (not e!232633))))

(declare-datatypes ((array!22519 0))(
  ( (array!22520 (arr!10728 (Array (_ BitVec 32) (_ BitVec 64))) (size!11081 (_ BitVec 32))) )
))
(declare-fun lt!179731 () array!22519)

(declare-datatypes ((List!6127 0))(
  ( (Nil!6124) (Cons!6123 (h!6979 (_ BitVec 64)) (t!11268 List!6127)) )
))
(declare-fun arrayNoDuplicates!0 (array!22519 (_ BitVec 32) List!6127) Bool)

(assert (=> b!382971 (= res!218031 (arrayNoDuplicates!0 lt!179731 #b00000000000000000000000000000000 Nil!6124))))

(declare-fun b!382973 () Bool)

(declare-fun e!232630 () Bool)

(assert (=> b!382973 (= e!232630 true)))

(declare-datatypes ((V!13523 0))(
  ( (V!13524 (val!4701 Int)) )
))
(declare-datatypes ((tuple2!6302 0))(
  ( (tuple2!6303 (_1!3162 (_ BitVec 64)) (_2!3162 V!13523)) )
))
(declare-datatypes ((List!6128 0))(
  ( (Nil!6125) (Cons!6124 (h!6980 tuple2!6302) (t!11269 List!6128)) )
))
(declare-datatypes ((ListLongMap!5205 0))(
  ( (ListLongMap!5206 (toList!2618 List!6128)) )
))
(declare-fun lt!179729 () ListLongMap!5205)

(declare-fun lt!179734 () ListLongMap!5205)

(declare-fun lt!179735 () tuple2!6302)

(declare-fun +!975 (ListLongMap!5205 tuple2!6302) ListLongMap!5205)

(assert (=> b!382973 (= lt!179729 (+!975 lt!179734 lt!179735))))

(declare-fun lt!179733 () ListLongMap!5205)

(declare-fun lt!179730 () ListLongMap!5205)

(assert (=> b!382973 (= lt!179733 lt!179730)))

(declare-fun b!382974 () Bool)

(declare-fun res!218033 () Bool)

(declare-fun e!232631 () Bool)

(assert (=> b!382974 (=> (not res!218033) (not e!232631))))

(declare-fun _keys!658 () array!22519)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382974 (= res!218033 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382975 () Bool)

(declare-fun res!218030 () Bool)

(assert (=> b!382975 (=> (not res!218030) (not e!232631))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4313 0))(
  ( (ValueCellFull!4313 (v!6892 V!13523)) (EmptyCell!4313) )
))
(declare-datatypes ((array!22521 0))(
  ( (array!22522 (arr!10729 (Array (_ BitVec 32) ValueCell!4313)) (size!11082 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22521)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!382975 (= res!218030 (and (= (size!11082 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11081 _keys!658) (size!11082 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382976 () Bool)

(declare-fun res!218034 () Bool)

(assert (=> b!382976 (=> (not res!218034) (not e!232631))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382976 (= res!218034 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11081 _keys!658))))))

(declare-fun mapNonEmpty!15534 () Bool)

(declare-fun mapRes!15534 () Bool)

(declare-fun tp!30711 () Bool)

(declare-fun e!232634 () Bool)

(assert (=> mapNonEmpty!15534 (= mapRes!15534 (and tp!30711 e!232634))))

(declare-fun mapRest!15534 () (Array (_ BitVec 32) ValueCell!4313))

(declare-fun mapValue!15534 () ValueCell!4313)

(declare-fun mapKey!15534 () (_ BitVec 32))

(assert (=> mapNonEmpty!15534 (= (arr!10729 _values!506) (store mapRest!15534 mapKey!15534 mapValue!15534))))

(declare-fun b!382977 () Bool)

(declare-fun res!218026 () Bool)

(assert (=> b!382977 (=> (not res!218026) (not e!232631))))

(assert (=> b!382977 (= res!218026 (or (= (select (arr!10728 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10728 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382978 () Bool)

(declare-fun res!218029 () Bool)

(assert (=> b!382978 (=> (not res!218029) (not e!232631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22519 (_ BitVec 32)) Bool)

(assert (=> b!382978 (= res!218029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382979 () Bool)

(declare-fun res!218027 () Bool)

(assert (=> b!382979 (=> (not res!218027) (not e!232631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382979 (= res!218027 (validKeyInArray!0 k0!778))))

(declare-fun b!382980 () Bool)

(assert (=> b!382980 (= e!232633 (not e!232630))))

(declare-fun res!218035 () Bool)

(assert (=> b!382980 (=> res!218035 e!232630)))

(declare-fun lt!179728 () Bool)

(assert (=> b!382980 (= res!218035 (or (and (not lt!179728) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179728) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179728)))))

(assert (=> b!382980 (= lt!179728 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13523)

(declare-fun minValue!472 () V!13523)

(declare-fun getCurrentListMap!2000 (array!22519 array!22521 (_ BitVec 32) (_ BitVec 32) V!13523 V!13523 (_ BitVec 32) Int) ListLongMap!5205)

(assert (=> b!382980 (= lt!179734 (getCurrentListMap!2000 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179736 () array!22521)

(assert (=> b!382980 (= lt!179733 (getCurrentListMap!2000 lt!179731 lt!179736 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179732 () ListLongMap!5205)

(assert (=> b!382980 (and (= lt!179730 lt!179732) (= lt!179732 lt!179730))))

(declare-fun lt!179727 () ListLongMap!5205)

(assert (=> b!382980 (= lt!179732 (+!975 lt!179727 lt!179735))))

(declare-fun v!373 () V!13523)

(assert (=> b!382980 (= lt!179735 (tuple2!6303 k0!778 v!373))))

(declare-datatypes ((Unit!11806 0))(
  ( (Unit!11807) )
))
(declare-fun lt!179726 () Unit!11806)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!193 (array!22519 array!22521 (_ BitVec 32) (_ BitVec 32) V!13523 V!13523 (_ BitVec 32) (_ BitVec 64) V!13523 (_ BitVec 32) Int) Unit!11806)

(assert (=> b!382980 (= lt!179726 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!193 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!865 (array!22519 array!22521 (_ BitVec 32) (_ BitVec 32) V!13523 V!13523 (_ BitVec 32) Int) ListLongMap!5205)

(assert (=> b!382980 (= lt!179730 (getCurrentListMapNoExtraKeys!865 lt!179731 lt!179736 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382980 (= lt!179736 (array!22522 (store (arr!10729 _values!506) i!548 (ValueCellFull!4313 v!373)) (size!11082 _values!506)))))

(assert (=> b!382980 (= lt!179727 (getCurrentListMapNoExtraKeys!865 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!218036 () Bool)

(assert (=> start!37524 (=> (not res!218036) (not e!232631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37524 (= res!218036 (validMask!0 mask!970))))

(assert (=> start!37524 e!232631))

(declare-fun e!232629 () Bool)

(declare-fun array_inv!7900 (array!22521) Bool)

(assert (=> start!37524 (and (array_inv!7900 _values!506) e!232629)))

(assert (=> start!37524 tp!30710))

(assert (=> start!37524 true))

(declare-fun tp_is_empty!9313 () Bool)

(assert (=> start!37524 tp_is_empty!9313))

(declare-fun array_inv!7901 (array!22519) Bool)

(assert (=> start!37524 (array_inv!7901 _keys!658)))

(declare-fun b!382972 () Bool)

(declare-fun e!232632 () Bool)

(assert (=> b!382972 (= e!232632 tp_is_empty!9313)))

(declare-fun mapIsEmpty!15534 () Bool)

(assert (=> mapIsEmpty!15534 mapRes!15534))

(declare-fun b!382981 () Bool)

(assert (=> b!382981 (= e!232631 e!232633)))

(declare-fun res!218028 () Bool)

(assert (=> b!382981 (=> (not res!218028) (not e!232633))))

(assert (=> b!382981 (= res!218028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179731 mask!970))))

(assert (=> b!382981 (= lt!179731 (array!22520 (store (arr!10728 _keys!658) i!548 k0!778) (size!11081 _keys!658)))))

(declare-fun b!382982 () Bool)

(assert (=> b!382982 (= e!232634 tp_is_empty!9313)))

(declare-fun b!382983 () Bool)

(assert (=> b!382983 (= e!232629 (and e!232632 mapRes!15534))))

(declare-fun condMapEmpty!15534 () Bool)

(declare-fun mapDefault!15534 () ValueCell!4313)

(assert (=> b!382983 (= condMapEmpty!15534 (= (arr!10729 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4313)) mapDefault!15534)))))

(declare-fun b!382984 () Bool)

(declare-fun res!218032 () Bool)

(assert (=> b!382984 (=> (not res!218032) (not e!232631))))

(assert (=> b!382984 (= res!218032 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6124))))

(assert (= (and start!37524 res!218036) b!382975))

(assert (= (and b!382975 res!218030) b!382978))

(assert (= (and b!382978 res!218029) b!382984))

(assert (= (and b!382984 res!218032) b!382976))

(assert (= (and b!382976 res!218034) b!382979))

(assert (= (and b!382979 res!218027) b!382977))

(assert (= (and b!382977 res!218026) b!382974))

(assert (= (and b!382974 res!218033) b!382981))

(assert (= (and b!382981 res!218028) b!382971))

(assert (= (and b!382971 res!218031) b!382980))

(assert (= (and b!382980 (not res!218035)) b!382973))

(assert (= (and b!382983 condMapEmpty!15534) mapIsEmpty!15534))

(assert (= (and b!382983 (not condMapEmpty!15534)) mapNonEmpty!15534))

(get-info :version)

(assert (= (and mapNonEmpty!15534 ((_ is ValueCellFull!4313) mapValue!15534)) b!382982))

(assert (= (and b!382983 ((_ is ValueCellFull!4313) mapDefault!15534)) b!382972))

(assert (= start!37524 b!382983))

(declare-fun m!379271 () Bool)

(assert (=> b!382978 m!379271))

(declare-fun m!379273 () Bool)

(assert (=> b!382977 m!379273))

(declare-fun m!379275 () Bool)

(assert (=> b!382974 m!379275))

(declare-fun m!379277 () Bool)

(assert (=> b!382971 m!379277))

(declare-fun m!379279 () Bool)

(assert (=> mapNonEmpty!15534 m!379279))

(declare-fun m!379281 () Bool)

(assert (=> b!382980 m!379281))

(declare-fun m!379283 () Bool)

(assert (=> b!382980 m!379283))

(declare-fun m!379285 () Bool)

(assert (=> b!382980 m!379285))

(declare-fun m!379287 () Bool)

(assert (=> b!382980 m!379287))

(declare-fun m!379289 () Bool)

(assert (=> b!382980 m!379289))

(declare-fun m!379291 () Bool)

(assert (=> b!382980 m!379291))

(declare-fun m!379293 () Bool)

(assert (=> b!382980 m!379293))

(declare-fun m!379295 () Bool)

(assert (=> b!382981 m!379295))

(declare-fun m!379297 () Bool)

(assert (=> b!382981 m!379297))

(declare-fun m!379299 () Bool)

(assert (=> b!382973 m!379299))

(declare-fun m!379301 () Bool)

(assert (=> start!37524 m!379301))

(declare-fun m!379303 () Bool)

(assert (=> start!37524 m!379303))

(declare-fun m!379305 () Bool)

(assert (=> start!37524 m!379305))

(declare-fun m!379307 () Bool)

(assert (=> b!382984 m!379307))

(declare-fun m!379309 () Bool)

(assert (=> b!382979 m!379309))

(check-sat (not mapNonEmpty!15534) (not b!382981) tp_is_empty!9313 (not b!382978) (not b!382973) (not b!382984) (not b!382974) (not start!37524) (not b!382980) (not b!382971) (not b!382979) (not b_next!8665) b_and!15881)
(check-sat b_and!15881 (not b_next!8665))
