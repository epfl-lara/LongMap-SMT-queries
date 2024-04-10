; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21150 () Bool)

(assert start!21150)

(declare-fun b_free!5621 () Bool)

(declare-fun b_next!5621 () Bool)

(assert (=> start!21150 (= b_free!5621 (not b_next!5621))))

(declare-fun tp!19931 () Bool)

(declare-fun b_and!12475 () Bool)

(assert (=> start!21150 (= tp!19931 b_and!12475)))

(declare-datatypes ((V!6957 0))(
  ( (V!6958 (val!2786 Int)) )
))
(declare-datatypes ((tuple2!4218 0))(
  ( (tuple2!4219 (_1!2120 (_ BitVec 64)) (_2!2120 V!6957)) )
))
(declare-datatypes ((List!3105 0))(
  ( (Nil!3102) (Cons!3101 (h!3743 tuple2!4218) (t!8054 List!3105)) )
))
(declare-datatypes ((ListLongMap!3131 0))(
  ( (ListLongMap!3132 (toList!1581 List!3105)) )
))
(declare-fun lt!109884 () ListLongMap!3131)

(declare-fun b!212961 () Bool)

(declare-fun lt!109887 () ListLongMap!3131)

(declare-fun lt!109886 () tuple2!4218)

(declare-fun e!138530 () Bool)

(declare-fun +!584 (ListLongMap!3131 tuple2!4218) ListLongMap!3131)

(assert (=> b!212961 (= e!138530 (= lt!109887 (+!584 lt!109884 lt!109886)))))

(declare-fun mapIsEmpty!9320 () Bool)

(declare-fun mapRes!9320 () Bool)

(assert (=> mapIsEmpty!9320 mapRes!9320))

(declare-fun b!212962 () Bool)

(declare-fun e!138535 () Bool)

(declare-fun tp_is_empty!5483 () Bool)

(assert (=> b!212962 (= e!138535 tp_is_empty!5483)))

(declare-fun b!212963 () Bool)

(declare-fun res!104188 () Bool)

(declare-fun e!138532 () Bool)

(assert (=> b!212963 (=> (not res!104188) (not e!138532))))

(declare-datatypes ((array!10169 0))(
  ( (array!10170 (arr!4826 (Array (_ BitVec 32) (_ BitVec 64))) (size!5151 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10169)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10169 (_ BitVec 32)) Bool)

(assert (=> b!212963 (= res!104188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212964 () Bool)

(declare-fun res!104184 () Bool)

(assert (=> b!212964 (=> (not res!104184) (not e!138532))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212964 (= res!104184 (validKeyInArray!0 k!843))))

(declare-fun res!104192 () Bool)

(assert (=> start!21150 (=> (not res!104192) (not e!138532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21150 (= res!104192 (validMask!0 mask!1149))))

(assert (=> start!21150 e!138532))

(declare-datatypes ((ValueCell!2398 0))(
  ( (ValueCellFull!2398 (v!4792 V!6957)) (EmptyCell!2398) )
))
(declare-datatypes ((array!10171 0))(
  ( (array!10172 (arr!4827 (Array (_ BitVec 32) ValueCell!2398)) (size!5152 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10171)

(declare-fun e!138533 () Bool)

(declare-fun array_inv!3193 (array!10171) Bool)

(assert (=> start!21150 (and (array_inv!3193 _values!649) e!138533)))

(assert (=> start!21150 true))

(assert (=> start!21150 tp_is_empty!5483))

(declare-fun array_inv!3194 (array!10169) Bool)

(assert (=> start!21150 (array_inv!3194 _keys!825)))

(assert (=> start!21150 tp!19931))

(declare-fun b!212965 () Bool)

(declare-fun res!104183 () Bool)

(assert (=> b!212965 (=> (not res!104183) (not e!138532))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!212965 (= res!104183 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5151 _keys!825))))))

(declare-fun b!212966 () Bool)

(declare-fun res!104190 () Bool)

(assert (=> b!212966 (=> (not res!104190) (not e!138532))))

(assert (=> b!212966 (= res!104190 (= (select (arr!4826 _keys!825) i!601) k!843))))

(declare-fun b!212967 () Bool)

(declare-fun res!104189 () Bool)

(assert (=> b!212967 (=> (not res!104189) (not e!138530))))

(declare-fun lt!109888 () ListLongMap!3131)

(declare-fun lt!109889 () ListLongMap!3131)

(assert (=> b!212967 (= res!104189 (= lt!109888 (+!584 lt!109889 lt!109886)))))

(declare-fun b!212968 () Bool)

(declare-fun e!138534 () Bool)

(assert (=> b!212968 (= e!138534 (not (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212968 e!138530))

(declare-fun res!104191 () Bool)

(assert (=> b!212968 (=> (not res!104191) (not e!138530))))

(declare-fun lt!109883 () ListLongMap!3131)

(assert (=> b!212968 (= res!104191 (= lt!109888 (+!584 lt!109883 lt!109886)))))

(declare-fun minValue!615 () V!6957)

(assert (=> b!212968 (= lt!109886 (tuple2!4219 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!9320 () Bool)

(declare-fun tp!19930 () Bool)

(declare-fun e!138531 () Bool)

(assert (=> mapNonEmpty!9320 (= mapRes!9320 (and tp!19930 e!138531))))

(declare-fun mapValue!9320 () ValueCell!2398)

(declare-fun mapRest!9320 () (Array (_ BitVec 32) ValueCell!2398))

(declare-fun mapKey!9320 () (_ BitVec 32))

(assert (=> mapNonEmpty!9320 (= (arr!4827 _values!649) (store mapRest!9320 mapKey!9320 mapValue!9320))))

(declare-fun b!212969 () Bool)

(declare-fun res!104186 () Bool)

(assert (=> b!212969 (=> (not res!104186) (not e!138532))))

(declare-datatypes ((List!3106 0))(
  ( (Nil!3103) (Cons!3102 (h!3744 (_ BitVec 64)) (t!8055 List!3106)) )
))
(declare-fun arrayNoDuplicates!0 (array!10169 (_ BitVec 32) List!3106) Bool)

(assert (=> b!212969 (= res!104186 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3103))))

(declare-fun b!212970 () Bool)

(declare-fun res!104187 () Bool)

(assert (=> b!212970 (=> (not res!104187) (not e!138532))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212970 (= res!104187 (and (= (size!5152 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5151 _keys!825) (size!5152 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212971 () Bool)

(assert (=> b!212971 (= e!138533 (and e!138535 mapRes!9320))))

(declare-fun condMapEmpty!9320 () Bool)

(declare-fun mapDefault!9320 () ValueCell!2398)

