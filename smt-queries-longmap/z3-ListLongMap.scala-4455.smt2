; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62082 () Bool)

(assert start!62082)

(declare-fun b!693981 () Bool)

(declare-fun res!457964 () Bool)

(declare-fun e!394895 () Bool)

(assert (=> b!693981 (=> (not res!457964) (not e!394895))))

(declare-datatypes ((List!13038 0))(
  ( (Nil!13035) (Cons!13034 (h!14082 (_ BitVec 64)) (t!19309 List!13038)) )
))
(declare-fun lt!316905 () List!13038)

(declare-fun noDuplicate!964 (List!13038) Bool)

(assert (=> b!693981 (= res!457964 (noDuplicate!964 lt!316905))))

(declare-fun b!693982 () Bool)

(declare-fun res!457972 () Bool)

(declare-fun e!394896 () Bool)

(assert (=> b!693982 (=> (not res!457972) (not e!394896))))

(declare-datatypes ((array!39861 0))(
  ( (array!39862 (arr!19090 (Array (_ BitVec 32) (_ BitVec 64))) (size!19473 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39861)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693982 (= res!457972 (validKeyInArray!0 (select (arr!19090 a!3626) from!3004)))))

(declare-fun b!693983 () Bool)

(declare-fun res!457974 () Bool)

(assert (=> b!693983 (=> (not res!457974) (not e!394895))))

(declare-fun contains!3690 (List!13038 (_ BitVec 64)) Bool)

(assert (=> b!693983 (= res!457974 (not (contains!3690 lt!316905 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693984 () Bool)

(declare-fun res!457984 () Bool)

(assert (=> b!693984 (=> (not res!457984) (not e!394896))))

(declare-fun acc!681 () List!13038)

(assert (=> b!693984 (= res!457984 (noDuplicate!964 acc!681))))

(declare-fun b!693986 () Bool)

(declare-fun e!394888 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!693986 (= e!394888 (contains!3690 acc!681 k0!2843))))

(declare-fun b!693987 () Bool)

(declare-fun e!394887 () Bool)

(assert (=> b!693987 (= e!394887 (contains!3690 lt!316905 k0!2843))))

(declare-fun b!693988 () Bool)

(assert (=> b!693988 (= e!394895 false)))

(declare-fun lt!316904 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39861 (_ BitVec 32) List!13038) Bool)

(assert (=> b!693988 (= lt!316904 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316905))))

(declare-fun b!693989 () Bool)

(declare-fun e!394886 () Bool)

(assert (=> b!693989 (= e!394886 (not (contains!3690 lt!316905 k0!2843)))))

(declare-fun b!693990 () Bool)

(declare-fun res!457971 () Bool)

(assert (=> b!693990 (=> (not res!457971) (not e!394896))))

(assert (=> b!693990 (= res!457971 (not (contains!3690 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693991 () Bool)

(declare-datatypes ((Unit!24477 0))(
  ( (Unit!24478) )
))
(declare-fun e!394892 () Unit!24477)

(declare-fun Unit!24479 () Unit!24477)

(assert (=> b!693991 (= e!394892 Unit!24479)))

(declare-fun b!693992 () Bool)

(declare-fun Unit!24480 () Unit!24477)

(assert (=> b!693992 (= e!394892 Unit!24480)))

(declare-fun arrayContainsKey!0 (array!39861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693992 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316906 () Unit!24477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39861 (_ BitVec 64) (_ BitVec 32)) Unit!24477)

(assert (=> b!693992 (= lt!316906 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!693992 false))

(declare-fun b!693993 () Bool)

(declare-fun res!457980 () Bool)

(assert (=> b!693993 (=> (not res!457980) (not e!394895))))

(declare-fun e!394889 () Bool)

(assert (=> b!693993 (= res!457980 e!394889)))

(declare-fun res!457977 () Bool)

(assert (=> b!693993 (=> res!457977 e!394889)))

(assert (=> b!693993 (= res!457977 e!394887)))

(declare-fun res!457975 () Bool)

(assert (=> b!693993 (=> (not res!457975) (not e!394887))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693993 (= res!457975 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693994 () Bool)

(declare-fun res!457966 () Bool)

(assert (=> b!693994 (=> (not res!457966) (not e!394896))))

(assert (=> b!693994 (= res!457966 (not (contains!3690 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693995 () Bool)

(declare-fun res!457987 () Bool)

(assert (=> b!693995 (=> (not res!457987) (not e!394896))))

(declare-fun e!394893 () Bool)

(assert (=> b!693995 (= res!457987 e!394893)))

(declare-fun res!457978 () Bool)

(assert (=> b!693995 (=> res!457978 e!394893)))

(assert (=> b!693995 (= res!457978 e!394888)))

(declare-fun res!457985 () Bool)

(assert (=> b!693995 (=> (not res!457985) (not e!394888))))

(assert (=> b!693995 (= res!457985 (bvsgt from!3004 i!1382))))

(declare-fun b!693996 () Bool)

(declare-fun e!394894 () Bool)

(assert (=> b!693996 (= e!394893 e!394894)))

(declare-fun res!457969 () Bool)

(assert (=> b!693996 (=> (not res!457969) (not e!394894))))

(assert (=> b!693996 (= res!457969 (bvsle from!3004 i!1382))))

(declare-fun b!693997 () Bool)

(declare-fun e!394890 () Bool)

(assert (=> b!693997 (= e!394890 e!394895)))

(declare-fun res!457967 () Bool)

(assert (=> b!693997 (=> (not res!457967) (not e!394895))))

(assert (=> b!693997 (= res!457967 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!422 (List!13038 (_ BitVec 64)) List!13038)

(assert (=> b!693997 (= lt!316905 ($colon$colon!422 acc!681 (select (arr!19090 a!3626) from!3004)))))

(declare-fun b!693998 () Bool)

(declare-fun res!457981 () Bool)

(assert (=> b!693998 (=> (not res!457981) (not e!394895))))

(assert (=> b!693998 (= res!457981 (not (contains!3690 lt!316905 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693999 () Bool)

(declare-fun res!457968 () Bool)

(assert (=> b!693999 (=> (not res!457968) (not e!394896))))

(assert (=> b!693999 (= res!457968 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694000 () Bool)

(declare-fun res!457983 () Bool)

(assert (=> b!694000 (=> (not res!457983) (not e!394896))))

(assert (=> b!694000 (= res!457983 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13035))))

(declare-fun res!457970 () Bool)

(assert (=> start!62082 (=> (not res!457970) (not e!394896))))

(assert (=> start!62082 (= res!457970 (and (bvslt (size!19473 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19473 a!3626))))))

(assert (=> start!62082 e!394896))

(assert (=> start!62082 true))

(declare-fun array_inv!14949 (array!39861) Bool)

(assert (=> start!62082 (array_inv!14949 a!3626)))

(declare-fun b!693985 () Bool)

(assert (=> b!693985 (= e!394889 e!394886)))

(declare-fun res!457976 () Bool)

(assert (=> b!693985 (=> (not res!457976) (not e!394886))))

(assert (=> b!693985 (= res!457976 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694001 () Bool)

(assert (=> b!694001 (= e!394896 e!394890)))

(declare-fun res!457965 () Bool)

(assert (=> b!694001 (=> (not res!457965) (not e!394890))))

(assert (=> b!694001 (= res!457965 (not (= (select (arr!19090 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316903 () Unit!24477)

(assert (=> b!694001 (= lt!316903 e!394892)))

(declare-fun c!78377 () Bool)

(assert (=> b!694001 (= c!78377 (= (select (arr!19090 a!3626) from!3004) k0!2843))))

(declare-fun b!694002 () Bool)

(declare-fun res!457986 () Bool)

(assert (=> b!694002 (=> (not res!457986) (not e!394896))))

(assert (=> b!694002 (= res!457986 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694003 () Bool)

(assert (=> b!694003 (= e!394894 (not (contains!3690 acc!681 k0!2843)))))

(declare-fun b!694004 () Bool)

(declare-fun res!457973 () Bool)

(assert (=> b!694004 (=> (not res!457973) (not e!394896))))

(assert (=> b!694004 (= res!457973 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19473 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694005 () Bool)

(declare-fun res!457979 () Bool)

(assert (=> b!694005 (=> (not res!457979) (not e!394896))))

(assert (=> b!694005 (= res!457979 (validKeyInArray!0 k0!2843))))

(declare-fun b!694006 () Bool)

(declare-fun res!457982 () Bool)

(assert (=> b!694006 (=> (not res!457982) (not e!394896))))

(assert (=> b!694006 (= res!457982 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19473 a!3626))))))

(assert (= (and start!62082 res!457970) b!693984))

(assert (= (and b!693984 res!457984) b!693990))

(assert (= (and b!693990 res!457971) b!693994))

(assert (= (and b!693994 res!457966) b!693995))

(assert (= (and b!693995 res!457985) b!693986))

(assert (= (and b!693995 (not res!457978)) b!693996))

(assert (= (and b!693996 res!457969) b!694003))

(assert (= (and b!693995 res!457987) b!694000))

(assert (= (and b!694000 res!457983) b!694002))

(assert (= (and b!694002 res!457986) b!694006))

(assert (= (and b!694006 res!457982) b!694005))

(assert (= (and b!694005 res!457979) b!693999))

(assert (= (and b!693999 res!457968) b!694004))

(assert (= (and b!694004 res!457973) b!693982))

(assert (= (and b!693982 res!457972) b!694001))

(assert (= (and b!694001 c!78377) b!693992))

(assert (= (and b!694001 (not c!78377)) b!693991))

(assert (= (and b!694001 res!457965) b!693997))

(assert (= (and b!693997 res!457967) b!693981))

(assert (= (and b!693981 res!457964) b!693983))

(assert (= (and b!693983 res!457974) b!693998))

(assert (= (and b!693998 res!457981) b!693993))

(assert (= (and b!693993 res!457975) b!693987))

(assert (= (and b!693993 (not res!457977)) b!693985))

(assert (= (and b!693985 res!457976) b!693989))

(assert (= (and b!693993 res!457980) b!693988))

(declare-fun m!656635 () Bool)

(assert (=> start!62082 m!656635))

(declare-fun m!656637 () Bool)

(assert (=> b!694005 m!656637))

(declare-fun m!656639 () Bool)

(assert (=> b!693984 m!656639))

(declare-fun m!656641 () Bool)

(assert (=> b!693994 m!656641))

(declare-fun m!656643 () Bool)

(assert (=> b!693986 m!656643))

(declare-fun m!656645 () Bool)

(assert (=> b!693989 m!656645))

(declare-fun m!656647 () Bool)

(assert (=> b!693990 m!656647))

(declare-fun m!656649 () Bool)

(assert (=> b!693992 m!656649))

(declare-fun m!656651 () Bool)

(assert (=> b!693992 m!656651))

(declare-fun m!656653 () Bool)

(assert (=> b!693988 m!656653))

(declare-fun m!656655 () Bool)

(assert (=> b!693997 m!656655))

(assert (=> b!693997 m!656655))

(declare-fun m!656657 () Bool)

(assert (=> b!693997 m!656657))

(assert (=> b!693987 m!656645))

(declare-fun m!656659 () Bool)

(assert (=> b!694002 m!656659))

(assert (=> b!694001 m!656655))

(declare-fun m!656661 () Bool)

(assert (=> b!693998 m!656661))

(declare-fun m!656663 () Bool)

(assert (=> b!693983 m!656663))

(declare-fun m!656665 () Bool)

(assert (=> b!694000 m!656665))

(declare-fun m!656667 () Bool)

(assert (=> b!693981 m!656667))

(assert (=> b!694003 m!656643))

(assert (=> b!693982 m!656655))

(assert (=> b!693982 m!656655))

(declare-fun m!656669 () Bool)

(assert (=> b!693982 m!656669))

(declare-fun m!656671 () Bool)

(assert (=> b!693999 m!656671))

(check-sat (not b!694005) (not b!694000) (not b!693988) (not b!694002) (not b!693987) (not b!693982) (not start!62082) (not b!693998) (not b!694003) (not b!693983) (not b!693984) (not b!693992) (not b!693999) (not b!693981) (not b!693986) (not b!693997) (not b!693990) (not b!693994) (not b!693989))
(check-sat)
