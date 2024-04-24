; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38750 () Bool)

(assert start!38750)

(declare-fun b!404041 () Bool)

(declare-fun res!232966 () Bool)

(declare-fun e!243121 () Bool)

(assert (=> b!404041 (=> (not res!232966) (not e!243121))))

(declare-datatypes ((array!24250 0))(
  ( (array!24251 (arr!11574 (Array (_ BitVec 32) (_ BitVec 64))) (size!11926 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24250)

(declare-datatypes ((List!6622 0))(
  ( (Nil!6619) (Cons!6618 (h!7474 (_ BitVec 64)) (t!11788 List!6622)) )
))
(declare-fun arrayNoDuplicates!0 (array!24250 (_ BitVec 32) List!6622) Bool)

(assert (=> b!404041 (= res!232966 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6619))))

(declare-fun b!404042 () Bool)

(declare-fun res!232969 () Bool)

(assert (=> b!404042 (=> (not res!232969) (not e!243121))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24250 (_ BitVec 32)) Bool)

(assert (=> b!404042 (= res!232969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404043 () Bool)

(declare-fun e!243119 () Bool)

(assert (=> b!404043 (= e!243121 e!243119)))

(declare-fun res!232970 () Bool)

(assert (=> b!404043 (=> (not res!232970) (not e!243119))))

(declare-fun lt!188147 () array!24250)

(assert (=> b!404043 (= res!232970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188147 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404043 (= lt!188147 (array!24251 (store (arr!11574 _keys!709) i!563 k0!794) (size!11926 _keys!709)))))

(declare-fun b!404044 () Bool)

(declare-fun e!243123 () Bool)

(declare-fun e!243124 () Bool)

(declare-fun mapRes!16896 () Bool)

(assert (=> b!404044 (= e!243123 (and e!243124 mapRes!16896))))

(declare-fun condMapEmpty!16896 () Bool)

(declare-datatypes ((V!14683 0))(
  ( (V!14684 (val!5136 Int)) )
))
(declare-datatypes ((ValueCell!4748 0))(
  ( (ValueCellFull!4748 (v!7384 V!14683)) (EmptyCell!4748) )
))
(declare-datatypes ((array!24252 0))(
  ( (array!24253 (arr!11575 (Array (_ BitVec 32) ValueCell!4748)) (size!11927 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24252)

(declare-fun mapDefault!16896 () ValueCell!4748)

(assert (=> b!404044 (= condMapEmpty!16896 (= (arr!11575 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4748)) mapDefault!16896)))))

(declare-fun b!404045 () Bool)

(declare-fun res!232965 () Bool)

(assert (=> b!404045 (=> (not res!232965) (not e!243121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404045 (= res!232965 (validMask!0 mask!1025))))

(declare-fun b!404046 () Bool)

(assert (=> b!404046 (= e!243119 false)))

(declare-fun lt!188148 () Bool)

(assert (=> b!404046 (= lt!188148 (arrayNoDuplicates!0 lt!188147 #b00000000000000000000000000000000 Nil!6619))))

(declare-fun b!404047 () Bool)

(declare-fun e!243122 () Bool)

(declare-fun tp_is_empty!10183 () Bool)

(assert (=> b!404047 (= e!243122 tp_is_empty!10183)))

(declare-fun b!404048 () Bool)

(declare-fun res!232974 () Bool)

(assert (=> b!404048 (=> (not res!232974) (not e!243121))))

(declare-fun arrayContainsKey!0 (array!24250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404048 (= res!232974 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404049 () Bool)

(assert (=> b!404049 (= e!243124 tp_is_empty!10183)))

(declare-fun res!232971 () Bool)

(assert (=> start!38750 (=> (not res!232971) (not e!243121))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38750 (= res!232971 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11926 _keys!709))))))

(assert (=> start!38750 e!243121))

(assert (=> start!38750 true))

(declare-fun array_inv!8548 (array!24252) Bool)

(assert (=> start!38750 (and (array_inv!8548 _values!549) e!243123)))

(declare-fun array_inv!8549 (array!24250) Bool)

(assert (=> start!38750 (array_inv!8549 _keys!709)))

(declare-fun b!404050 () Bool)

(declare-fun res!232967 () Bool)

(assert (=> b!404050 (=> (not res!232967) (not e!243121))))

(assert (=> b!404050 (= res!232967 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11926 _keys!709))))))

(declare-fun mapIsEmpty!16896 () Bool)

(assert (=> mapIsEmpty!16896 mapRes!16896))

(declare-fun b!404051 () Bool)

(declare-fun res!232968 () Bool)

(assert (=> b!404051 (=> (not res!232968) (not e!243121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404051 (= res!232968 (validKeyInArray!0 k0!794))))

(declare-fun b!404052 () Bool)

(declare-fun res!232973 () Bool)

(assert (=> b!404052 (=> (not res!232973) (not e!243121))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404052 (= res!232973 (and (= (size!11927 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11926 _keys!709) (size!11927 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16896 () Bool)

(declare-fun tp!33015 () Bool)

(assert (=> mapNonEmpty!16896 (= mapRes!16896 (and tp!33015 e!243122))))

(declare-fun mapKey!16896 () (_ BitVec 32))

(declare-fun mapRest!16896 () (Array (_ BitVec 32) ValueCell!4748))

(declare-fun mapValue!16896 () ValueCell!4748)

(assert (=> mapNonEmpty!16896 (= (arr!11575 _values!549) (store mapRest!16896 mapKey!16896 mapValue!16896))))

(declare-fun b!404053 () Bool)

(declare-fun res!232972 () Bool)

(assert (=> b!404053 (=> (not res!232972) (not e!243121))))

(assert (=> b!404053 (= res!232972 (or (= (select (arr!11574 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11574 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38750 res!232971) b!404045))

(assert (= (and b!404045 res!232965) b!404052))

(assert (= (and b!404052 res!232973) b!404042))

(assert (= (and b!404042 res!232969) b!404041))

(assert (= (and b!404041 res!232966) b!404050))

(assert (= (and b!404050 res!232967) b!404051))

(assert (= (and b!404051 res!232968) b!404053))

(assert (= (and b!404053 res!232972) b!404048))

(assert (= (and b!404048 res!232974) b!404043))

(assert (= (and b!404043 res!232970) b!404046))

(assert (= (and b!404044 condMapEmpty!16896) mapIsEmpty!16896))

(assert (= (and b!404044 (not condMapEmpty!16896)) mapNonEmpty!16896))

(get-info :version)

(assert (= (and mapNonEmpty!16896 ((_ is ValueCellFull!4748) mapValue!16896)) b!404047))

(assert (= (and b!404044 ((_ is ValueCellFull!4748) mapDefault!16896)) b!404049))

(assert (= start!38750 b!404044))

(declare-fun m!397293 () Bool)

(assert (=> start!38750 m!397293))

(declare-fun m!397295 () Bool)

(assert (=> start!38750 m!397295))

(declare-fun m!397297 () Bool)

(assert (=> b!404043 m!397297))

(declare-fun m!397299 () Bool)

(assert (=> b!404043 m!397299))

(declare-fun m!397301 () Bool)

(assert (=> b!404042 m!397301))

(declare-fun m!397303 () Bool)

(assert (=> b!404053 m!397303))

(declare-fun m!397305 () Bool)

(assert (=> mapNonEmpty!16896 m!397305))

(declare-fun m!397307 () Bool)

(assert (=> b!404046 m!397307))

(declare-fun m!397309 () Bool)

(assert (=> b!404041 m!397309))

(declare-fun m!397311 () Bool)

(assert (=> b!404051 m!397311))

(declare-fun m!397313 () Bool)

(assert (=> b!404045 m!397313))

(declare-fun m!397315 () Bool)

(assert (=> b!404048 m!397315))

(check-sat (not b!404045) (not mapNonEmpty!16896) (not b!404046) (not b!404051) (not b!404048) tp_is_empty!10183 (not b!404042) (not b!404043) (not b!404041) (not start!38750))
(check-sat)
