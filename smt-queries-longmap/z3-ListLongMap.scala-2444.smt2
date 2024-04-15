; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38468 () Bool)

(assert start!38468)

(declare-fun mapIsEmpty!16473 () Bool)

(declare-fun mapRes!16473 () Bool)

(assert (=> mapIsEmpty!16473 mapRes!16473))

(declare-fun b!397024 () Bool)

(declare-fun res!227965 () Bool)

(declare-fun e!240116 () Bool)

(assert (=> b!397024 (=> (not res!227965) (not e!240116))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397024 (= res!227965 (validKeyInArray!0 k0!794))))

(declare-fun b!397025 () Bool)

(declare-fun res!227963 () Bool)

(assert (=> b!397025 (=> (not res!227963) (not e!240116))))

(declare-datatypes ((array!23697 0))(
  ( (array!23698 (arr!11298 (Array (_ BitVec 32) (_ BitVec 64))) (size!11651 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23697)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14307 0))(
  ( (V!14308 (val!4995 Int)) )
))
(declare-datatypes ((ValueCell!4607 0))(
  ( (ValueCellFull!4607 (v!7236 V!14307)) (EmptyCell!4607) )
))
(declare-datatypes ((array!23699 0))(
  ( (array!23700 (arr!11299 (Array (_ BitVec 32) ValueCell!4607)) (size!11652 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23699)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!397025 (= res!227963 (and (= (size!11652 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11651 _keys!709) (size!11652 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397026 () Bool)

(declare-fun e!240119 () Bool)

(declare-fun tp_is_empty!9901 () Bool)

(assert (=> b!397026 (= e!240119 tp_is_empty!9901)))

(declare-fun b!397027 () Bool)

(declare-fun res!227967 () Bool)

(assert (=> b!397027 (=> (not res!227967) (not e!240116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23697 (_ BitVec 32)) Bool)

(assert (=> b!397027 (= res!227967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!227966 () Bool)

(assert (=> start!38468 (=> (not res!227966) (not e!240116))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38468 (= res!227966 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11651 _keys!709))))))

(assert (=> start!38468 e!240116))

(assert (=> start!38468 true))

(declare-fun e!240120 () Bool)

(declare-fun array_inv!8296 (array!23699) Bool)

(assert (=> start!38468 (and (array_inv!8296 _values!549) e!240120)))

(declare-fun array_inv!8297 (array!23697) Bool)

(assert (=> start!38468 (array_inv!8297 _keys!709)))

(declare-fun b!397028 () Bool)

(declare-fun res!227970 () Bool)

(assert (=> b!397028 (=> (not res!227970) (not e!240116))))

(declare-datatypes ((List!6506 0))(
  ( (Nil!6503) (Cons!6502 (h!7358 (_ BitVec 64)) (t!11671 List!6506)) )
))
(declare-fun arrayNoDuplicates!0 (array!23697 (_ BitVec 32) List!6506) Bool)

(assert (=> b!397028 (= res!227970 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6503))))

(declare-fun b!397029 () Bool)

(declare-fun res!227969 () Bool)

(assert (=> b!397029 (=> (not res!227969) (not e!240116))))

(declare-fun arrayContainsKey!0 (array!23697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397029 (= res!227969 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397030 () Bool)

(declare-fun res!227968 () Bool)

(assert (=> b!397030 (=> (not res!227968) (not e!240116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397030 (= res!227968 (validMask!0 mask!1025))))

(declare-fun b!397031 () Bool)

(declare-fun e!240118 () Bool)

(assert (=> b!397031 (= e!240118 false)))

(declare-fun lt!187048 () Bool)

(declare-fun lt!187049 () array!23697)

(assert (=> b!397031 (= lt!187048 (arrayNoDuplicates!0 lt!187049 #b00000000000000000000000000000000 Nil!6503))))

(declare-fun b!397032 () Bool)

(declare-fun res!227962 () Bool)

(assert (=> b!397032 (=> (not res!227962) (not e!240116))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397032 (= res!227962 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11651 _keys!709))))))

(declare-fun mapNonEmpty!16473 () Bool)

(declare-fun tp!32268 () Bool)

(assert (=> mapNonEmpty!16473 (= mapRes!16473 (and tp!32268 e!240119))))

(declare-fun mapValue!16473 () ValueCell!4607)

(declare-fun mapRest!16473 () (Array (_ BitVec 32) ValueCell!4607))

(declare-fun mapKey!16473 () (_ BitVec 32))

(assert (=> mapNonEmpty!16473 (= (arr!11299 _values!549) (store mapRest!16473 mapKey!16473 mapValue!16473))))

(declare-fun b!397033 () Bool)

(declare-fun e!240117 () Bool)

(assert (=> b!397033 (= e!240117 tp_is_empty!9901)))

(declare-fun b!397034 () Bool)

(assert (=> b!397034 (= e!240120 (and e!240117 mapRes!16473))))

(declare-fun condMapEmpty!16473 () Bool)

(declare-fun mapDefault!16473 () ValueCell!4607)

(assert (=> b!397034 (= condMapEmpty!16473 (= (arr!11299 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4607)) mapDefault!16473)))))

(declare-fun b!397035 () Bool)

(declare-fun res!227961 () Bool)

(assert (=> b!397035 (=> (not res!227961) (not e!240116))))

(assert (=> b!397035 (= res!227961 (or (= (select (arr!11298 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11298 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397036 () Bool)

(assert (=> b!397036 (= e!240116 e!240118)))

(declare-fun res!227964 () Bool)

(assert (=> b!397036 (=> (not res!227964) (not e!240118))))

(assert (=> b!397036 (= res!227964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187049 mask!1025))))

(assert (=> b!397036 (= lt!187049 (array!23698 (store (arr!11298 _keys!709) i!563 k0!794) (size!11651 _keys!709)))))

(assert (= (and start!38468 res!227966) b!397030))

(assert (= (and b!397030 res!227968) b!397025))

(assert (= (and b!397025 res!227963) b!397027))

(assert (= (and b!397027 res!227967) b!397028))

(assert (= (and b!397028 res!227970) b!397032))

(assert (= (and b!397032 res!227962) b!397024))

(assert (= (and b!397024 res!227965) b!397035))

(assert (= (and b!397035 res!227961) b!397029))

(assert (= (and b!397029 res!227969) b!397036))

(assert (= (and b!397036 res!227964) b!397031))

(assert (= (and b!397034 condMapEmpty!16473) mapIsEmpty!16473))

(assert (= (and b!397034 (not condMapEmpty!16473)) mapNonEmpty!16473))

(get-info :version)

(assert (= (and mapNonEmpty!16473 ((_ is ValueCellFull!4607) mapValue!16473)) b!397026))

(assert (= (and b!397034 ((_ is ValueCellFull!4607) mapDefault!16473)) b!397033))

(assert (= start!38468 b!397034))

(declare-fun m!391875 () Bool)

(assert (=> b!397036 m!391875))

(declare-fun m!391877 () Bool)

(assert (=> b!397036 m!391877))

(declare-fun m!391879 () Bool)

(assert (=> b!397027 m!391879))

(declare-fun m!391881 () Bool)

(assert (=> b!397030 m!391881))

(declare-fun m!391883 () Bool)

(assert (=> b!397028 m!391883))

(declare-fun m!391885 () Bool)

(assert (=> mapNonEmpty!16473 m!391885))

(declare-fun m!391887 () Bool)

(assert (=> b!397035 m!391887))

(declare-fun m!391889 () Bool)

(assert (=> b!397024 m!391889))

(declare-fun m!391891 () Bool)

(assert (=> b!397031 m!391891))

(declare-fun m!391893 () Bool)

(assert (=> b!397029 m!391893))

(declare-fun m!391895 () Bool)

(assert (=> start!38468 m!391895))

(declare-fun m!391897 () Bool)

(assert (=> start!38468 m!391897))

(check-sat (not b!397028) (not b!397024) (not b!397036) (not start!38468) (not b!397030) (not mapNonEmpty!16473) tp_is_empty!9901 (not b!397029) (not b!397027) (not b!397031))
(check-sat)
