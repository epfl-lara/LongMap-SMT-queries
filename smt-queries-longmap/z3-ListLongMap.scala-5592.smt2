; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73504 () Bool)

(assert start!73504)

(declare-fun b_free!14251 () Bool)

(declare-fun b_next!14251 () Bool)

(assert (=> start!73504 (= b_free!14251 (not b_next!14251))))

(declare-fun tp!50258 () Bool)

(declare-fun b_and!23617 () Bool)

(assert (=> start!73504 (= tp!50258 b_and!23617)))

(declare-fun b!856570 () Bool)

(declare-fun res!581469 () Bool)

(declare-fun e!477607 () Bool)

(assert (=> b!856570 (=> (not res!581469) (not e!477607))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856570 (= res!581469 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!26180 () Bool)

(declare-fun mapRes!26180 () Bool)

(declare-fun tp!50257 () Bool)

(declare-fun e!477608 () Bool)

(assert (=> mapNonEmpty!26180 (= mapRes!26180 (and tp!50257 e!477608))))

(declare-datatypes ((V!26897 0))(
  ( (V!26898 (val!8241 Int)) )
))
(declare-datatypes ((ValueCell!7754 0))(
  ( (ValueCellFull!7754 (v!10666 V!26897)) (EmptyCell!7754) )
))
(declare-fun mapRest!26180 () (Array (_ BitVec 32) ValueCell!7754))

(declare-datatypes ((array!49015 0))(
  ( (array!49016 (arr!23534 (Array (_ BitVec 32) ValueCell!7754)) (size!23975 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49015)

(declare-fun mapKey!26180 () (_ BitVec 32))

(declare-fun mapValue!26180 () ValueCell!7754)

(assert (=> mapNonEmpty!26180 (= (arr!23534 _values!688) (store mapRest!26180 mapKey!26180 mapValue!26180))))

(declare-fun b!856571 () Bool)

(assert (=> b!856571 (= e!477607 false)))

(declare-fun v!557 () V!26897)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!49017 0))(
  ( (array!49018 (arr!23535 (Array (_ BitVec 32) (_ BitVec 64))) (size!23976 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49017)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26897)

(declare-datatypes ((tuple2!10780 0))(
  ( (tuple2!10781 (_1!5401 (_ BitVec 64)) (_2!5401 V!26897)) )
))
(declare-datatypes ((List!16626 0))(
  ( (Nil!16623) (Cons!16622 (h!17759 tuple2!10780) (t!23259 List!16626)) )
))
(declare-datatypes ((ListLongMap!9551 0))(
  ( (ListLongMap!9552 (toList!4791 List!16626)) )
))
(declare-fun lt!386102 () ListLongMap!9551)

(declare-fun zeroValue!654 () V!26897)

(declare-fun getCurrentListMapNoExtraKeys!2847 (array!49017 array!49015 (_ BitVec 32) (_ BitVec 32) V!26897 V!26897 (_ BitVec 32) Int) ListLongMap!9551)

(assert (=> b!856571 (= lt!386102 (getCurrentListMapNoExtraKeys!2847 _keys!868 (array!49016 (store (arr!23534 _values!688) i!612 (ValueCellFull!7754 v!557)) (size!23975 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!386101 () ListLongMap!9551)

(assert (=> b!856571 (= lt!386101 (getCurrentListMapNoExtraKeys!2847 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!581466 () Bool)

(assert (=> start!73504 (=> (not res!581466) (not e!477607))))

(assert (=> start!73504 (= res!581466 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23976 _keys!868))))))

(assert (=> start!73504 e!477607))

(declare-fun tp_is_empty!16387 () Bool)

(assert (=> start!73504 tp_is_empty!16387))

(assert (=> start!73504 true))

(assert (=> start!73504 tp!50258))

(declare-fun array_inv!18694 (array!49017) Bool)

(assert (=> start!73504 (array_inv!18694 _keys!868)))

(declare-fun e!477609 () Bool)

(declare-fun array_inv!18695 (array!49015) Bool)

(assert (=> start!73504 (and (array_inv!18695 _values!688) e!477609)))

(declare-fun b!856572 () Bool)

(declare-fun res!581467 () Bool)

(assert (=> b!856572 (=> (not res!581467) (not e!477607))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856572 (= res!581467 (validKeyInArray!0 k0!854))))

(declare-fun b!856573 () Bool)

(declare-fun res!581470 () Bool)

(assert (=> b!856573 (=> (not res!581470) (not e!477607))))

(assert (=> b!856573 (= res!581470 (and (= (select (arr!23535 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856574 () Bool)

(declare-fun e!477606 () Bool)

(assert (=> b!856574 (= e!477606 tp_is_empty!16387)))

(declare-fun b!856575 () Bool)

(declare-fun res!581468 () Bool)

(assert (=> b!856575 (=> (not res!581468) (not e!477607))))

(assert (=> b!856575 (= res!581468 (and (= (size!23975 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23976 _keys!868) (size!23975 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856576 () Bool)

(assert (=> b!856576 (= e!477608 tp_is_empty!16387)))

(declare-fun mapIsEmpty!26180 () Bool)

(assert (=> mapIsEmpty!26180 mapRes!26180))

(declare-fun b!856577 () Bool)

(declare-fun res!581471 () Bool)

(assert (=> b!856577 (=> (not res!581471) (not e!477607))))

(declare-datatypes ((List!16627 0))(
  ( (Nil!16624) (Cons!16623 (h!17760 (_ BitVec 64)) (t!23260 List!16627)) )
))
(declare-fun arrayNoDuplicates!0 (array!49017 (_ BitVec 32) List!16627) Bool)

(assert (=> b!856577 (= res!581471 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16624))))

(declare-fun b!856578 () Bool)

(assert (=> b!856578 (= e!477609 (and e!477606 mapRes!26180))))

(declare-fun condMapEmpty!26180 () Bool)

(declare-fun mapDefault!26180 () ValueCell!7754)

(assert (=> b!856578 (= condMapEmpty!26180 (= (arr!23534 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7754)) mapDefault!26180)))))

(declare-fun b!856579 () Bool)

(declare-fun res!581472 () Bool)

(assert (=> b!856579 (=> (not res!581472) (not e!477607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49017 (_ BitVec 32)) Bool)

(assert (=> b!856579 (= res!581472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856580 () Bool)

(declare-fun res!581473 () Bool)

(assert (=> b!856580 (=> (not res!581473) (not e!477607))))

(assert (=> b!856580 (= res!581473 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23976 _keys!868))))))

(assert (= (and start!73504 res!581466) b!856570))

(assert (= (and b!856570 res!581469) b!856575))

(assert (= (and b!856575 res!581468) b!856579))

(assert (= (and b!856579 res!581472) b!856577))

(assert (= (and b!856577 res!581471) b!856580))

(assert (= (and b!856580 res!581473) b!856572))

(assert (= (and b!856572 res!581467) b!856573))

(assert (= (and b!856573 res!581470) b!856571))

(assert (= (and b!856578 condMapEmpty!26180) mapIsEmpty!26180))

(assert (= (and b!856578 (not condMapEmpty!26180)) mapNonEmpty!26180))

(get-info :version)

(assert (= (and mapNonEmpty!26180 ((_ is ValueCellFull!7754) mapValue!26180)) b!856576))

(assert (= (and b!856578 ((_ is ValueCellFull!7754) mapDefault!26180)) b!856574))

(assert (= start!73504 b!856578))

(declare-fun m!798083 () Bool)

(assert (=> b!856579 m!798083))

(declare-fun m!798085 () Bool)

(assert (=> b!856577 m!798085))

(declare-fun m!798087 () Bool)

(assert (=> mapNonEmpty!26180 m!798087))

(declare-fun m!798089 () Bool)

(assert (=> b!856570 m!798089))

(declare-fun m!798091 () Bool)

(assert (=> b!856573 m!798091))

(declare-fun m!798093 () Bool)

(assert (=> b!856572 m!798093))

(declare-fun m!798095 () Bool)

(assert (=> start!73504 m!798095))

(declare-fun m!798097 () Bool)

(assert (=> start!73504 m!798097))

(declare-fun m!798099 () Bool)

(assert (=> b!856571 m!798099))

(declare-fun m!798101 () Bool)

(assert (=> b!856571 m!798101))

(declare-fun m!798103 () Bool)

(assert (=> b!856571 m!798103))

(check-sat (not b!856577) tp_is_empty!16387 (not mapNonEmpty!26180) (not b!856570) (not b!856572) (not b!856571) (not start!73504) b_and!23617 (not b_next!14251) (not b!856579))
(check-sat b_and!23617 (not b_next!14251))
